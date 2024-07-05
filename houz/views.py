from requests.sessions import Session
from .models import (
    Room,
    Profile,
    Rating,
    Bookmark,
    Notification,
    Reservation,
    Image,
    HouseRule,
    Amenity,
    Comment,
    Region_Choices,
    Currencies,
    RoomTypes,
    ExchangeRate
)
from django.db.models import Q, Max
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.urls import reverse_lazy
from django.contrib.auth.views import PasswordChangeView
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponseRedirect, HttpResponseNotFound
from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.http import JsonResponse
from datetime import datetime, timedelta
from django.core.serializers import serialize
from django.forms.models import model_to_dict
import json, os , string
from django.core.serializers.json import DjangoJSONEncoder
from django.template.loader import render_to_string
from django.conf import settings
from django.db.models import Count
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from django.views.decorators.csrf import csrf_exempt
from django.utils import translation
import requests
from google_currency import convert  


def is_ajax(request):
    return request.META.get("HTTP_X_REQUESTED_WITH") == "XMLHttpRequest"


def home(request):
    rooms = Room.objects.all()
    currency = show_currency(request.session.get('currency', 'UZS'))
    
    for room in rooms:
        room.converted_price = convert_price(room.currency, request.session.get('currency', 'UZS'), room.price)

    return render(request, "basic/home.html", {"rooms": rooms, "currency": currency})

def create_notification(
    sender,
    reciever,
    message,
    type,
    profile_name,
    avatar_url,
    avatar_default,
    room_host,
    room_id=0,
    room=None,
    check_in=None,
    check_out=None,
):
    if type == "host":
        Notification.objects.create(
            sender=sender,
            reciever=reciever,
            room=room,
            message=message,
            check_in=check_in,
            check_out=check_out,
        )
    elif type == "user":
        Notification.objects.create(sender=sender, reciever=reciever, message=message)

    check_in_str = str(check_in) if check_in else None
    check_out_str = str(check_out) if check_out else None

    # Fetch the created_at value from the database and convert it to a string
    created_at = (
        Notification.objects.filter(reciever=reciever)
        .order_by("-created_at")
        .values_list("created_at", flat=True)  # Get only the values from the queryset
        .first()  # Get the first value from the queryset
    )

    # Convert created_at to string if it exists
    created_at_str = created_at.isoformat() if created_at else None

    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        "public_room",
        {
            "type": "send_notification",
            "sender": sender.id,
            "reciever": reciever.id,
            "room": room_id,
            "message": message,
            "check_in": check_in_str,
            "check_out": check_out_str,
            "profile_name": profile_name,
            "avatar_url": avatar_url,
            "avatar_default": avatar_default,
            "room_host": room_host,
            "created_at": created_at_str,
        },
    )


def noty_delete(request, noty_id):
    noty = get_object_or_404(Notification, pk=noty_id)
    if request.method == "POST":
        noty.delete()

    return redirect("home")


def reservation(request):
    reservations = Reservation.objects.filter(room__host=request.user).order_by(
        "-created_at"
    )
    return render(request, "basic/reservation.html", {"reservations": reservations})


def reservation_delete(request, reservation_id):
    reservation = Reservation.objects.get(pk=reservation_id)
    if request.method == "POST":
        if request.user == reservation.room.host:

            tolerance_window = timedelta(seconds=5)
            start_time = reservation.created_at - tolerance_window
            end_time = reservation.created_at + tolerance_window

            noty = Notification.objects.filter(
                reciever=request.user,
                created_at__gte=start_time,
                created_at__lte=end_time,
            )

            noty.delete()

            # notify about cancellation
            not_msg = f'Sorry, but the your <a class="roomUrl" href="/rooms/{reservation.room.id}" class="underline" style="color: #06c;">reservation</a> has been cancelled by the host'
            create_notification(
                sender=request.user,
                reciever=reservation.user,
                message=not_msg,
                profile_name=request.user.profile.name,
                avatar_url=(
                    request.user.profile.avatar.url
                    if request.user.profile.avatar
                    else None
                ),
                avatar_default=request.user.profile.avatar_default,
                room_host=request.user.username,
                type="user",
            )
            messages.success(
                request,
                "User has been notified about your cancellation",
            )

            reservation.delete()

            return redirect("reservation")
    return redirect("home")


def book_room(request, room_id):
    room = Room.objects.get(pk=room_id)
    if request.method == "POST":
        check_in_str = request.POST.get("check_in")
        check_out_str = request.POST.get("check_out")

        if not check_in_str or not check_out_str:
            # Handle case where check_in or check_out is not provided
            messages.error(request, "Please provide both check-in and check-out dates.")
            return render(request, "basic/room.html", {"room": room})

        check_in = datetime.strptime(check_in_str, "%Y-%m-%d").date()
        check_out = datetime.strptime(check_out_str, "%Y-%m-%d").date()

        if room.host != request.user:
            if (
                room.check_in <= check_in < room.check_out
                and room.check_in < check_out <= room.check_out
            ):
                if check_in < check_out and check_in != check_out:
                    # check if this user already notified the owner, so he can't spam him
                    if not Reservation.objects.filter(
                        user=request.user,
                        room=room,
                        check_in=check_in,
                        check_out=check_out,
                    ).exists():
                        if not Notification.objects.filter(
                            sender=request.user, room=room
                        ).exists():
                            not_message = f'Hi, I would like to book your <a class="roomUrl" href="/rooms/{str(room.id)}" class="underline" style="color: #06c;">room</a>'

                            # websocker notification
                            create_notification(
                                sender=request.user,
                                reciever=room.host,
                                message=not_message,
                                room=room,
                                room_id=room.id,
                                check_in=check_in,
                                check_out=check_out,
                                profile_name=request.user.profile.name,
                                avatar_url=(
                                    request.user.profile.avatar.url
                                    if request.user.profile.avatar
                                    else None
                                ),
                                avatar_default=request.user.profile.avatar_default,
                                room_host=room.host.username,
                                type="host",
                            )

                            messages.success(
                                request,
                                "Room's host has been notified, you will get host's response soon",
                            )
                            # return redirect("room_detail_url", room_id)
                            return JsonResponse({"room_id": room_id})
                        else:
                            messages.info(
                                request,
                                "Please have some respect and patience, if host is not responding to notification, give him a call",
                            )
                            return redirect("room_detail_url", room_id)
                    else:
                        messages.info(
                            request,
                            "You already booked the same room with the same dates",
                        )
                        return redirect("room_detail_url", room_id)
                else:
                    messages.info(request, "Chosen dates are incorrect")
                    return redirect("room_detail_url", room_id)
            else:
                # If dates are not within the available range, display error
                messages.info(
                    request, "Selected dates are not within the available range."
                )
                return redirect("room_detail_url", room_id)
        else:
            messages.info(request, "You can't book your own room")
            return redirect("room_detail_url", room_id)
    return render(request, "basic/room.html", {"room": room})


def confirm_room(request, noty_id):
    notification = Notification.objects.get(id=noty_id)
    room = Room.objects.get(pk=notification.room.id)

    # Check if the current user is the host of the room
    if request.method == "POST":
        action = request.POST.get("action")
        if action == "confirm":
            noty_check_in = notification.check_in
            noty_check_out = notification.check_out

            if not Reservation.objects.filter(
                room=room, check_in=noty_check_in, check_out=noty_check_out
            ).exists():
                not_message = f"Thank you for reservation, we will be waiting for you on {noty_check_in}"

                Reservation.objects.create(
                    user=notification.sender,
                    room=room,
                    check_in=noty_check_in,
                    check_out=noty_check_out,
                )
                # websocket notification
                create_notification(
                    sender=notification.reciever,
                    reciever=notification.sender,
                    message=not_message,
                    profile_name=notification.reciever.profile.name,
                    avatar_url=(
                        notification.reciever.profile.avatar.url
                        if notification.reciever.profile.avatar
                        else None
                    ),
                    avatar_default=notification.reciever.profile.avatar_default,
                    room_host=room.host.username,
                    type="user",
                )

                # Confirm the notification
                notification.confirmed = True
                notification.save()

                return redirect("reservation")
            else:
                not_message = f"We are really sorry, but unfortunately room was booked with the same dates by other people"

                # webscoket notification
                create_notification(
                    sender=notification.reciever,
                    reciever=notification.sender,
                    message=not_message,
                    profile_name=notification.reciever.profile.name,
                    avatar_url=(
                        notification.reciever.profile.avatar.url
                        if notification.reciever.profile.avatar
                        else None
                    ),
                    avatar_default=notification.reciever.profile.avatar_default,
                    room_host=room.host.username,
                    type="user",
                )

                messages.info(
                    request,
                    "This room with these dates is already booked by other user",
                )
                notification.delete()
        elif action == "cancel":
            not_message = f"Unfortunately the host declined your booked room"
            # UserNotification.objects.create(
            #     sender=request.user,
            #     reciever=notification.sender,
            #     message=not_message,
            # )

            # webscoket notification
            create_notification(
                sender=request.user,
                reciever=notification.sender,
                message=not_message,
                profile_name=notification.reciever.profile.name,
                avatar_url=(
                    notification.reciever.profile.avatar.url
                    if notification.reciever.profile.avatar
                    else None
                ),
                avatar_default=notification.reciever.profile.avatar_default,
                room_host=room.host.username,
                type="user",
            )
            notification.delete()
            messages.info(request, "User has been notified of this cancellation")

        return redirect("home")

    return redirect("home")


def user_profile(request, username):
    user = get_object_or_404(User, username__exact=username)
    is_own_profile = user == request.user
    rooms = user.room_set.all().order_by("-date")
    
    currency = show_currency(request.session.get('currency', 'UZS'))
    
    for room in rooms:
        room.converted_price = convert_price(room.currency, request.session.get('currency', 'UZS'), room.price)
        
    comments = Comment.objects.filter(reciever=user).order_by("-created_at")
    reviews = Rating.objects.filter(room__in=rooms).order_by("-date")
    rating_count = reviews.count()
    return render(
        request,
        "basic/user.html",
        {
            "user": user,
            "is_own_profile": is_own_profile,
            "rooms": rooms,
            "comments": comments,
            "reviews": reviews,
            "rating_count": rating_count,
            "currency": currency
        },
    )


def signup(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST["username"]
            name = request.POST["name"]
            password = request.POST["password"]
            confirm = request.POST["confirm"]

            if len(password) >= 8:
                if password == confirm:
                    if User.objects.filter(username=username).exists():
                        messages.error(request, "This Username is taken. Try again")
                        return redirect("signup")

                    else:
                        user = User.objects.create_user(
                            username=username,
                            first_name=name,
                            password=password,
                        )
                        user.save()

                        # create Profile
                        user_model = User.objects.get(username=username)
                        new_profile = Profile.objects.create(
                            user=user_model, name=name
                        )
                        new_profile.save()
                        messages.success(
                            request, "Successfuly created your account, now sign in"
                        )
                        return redirect("signin")

                else:
                    messages.error(request, "Those passwords didn't match. Try again.")
                    return redirect("signup")
            else:
                messages.error(request, "Use 8 characters or more for your password")
                return redirect("signup")

        else:
            return render(request, "basic/signup.html")
    return redirect("home")


def signin(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            userinput = request.POST["username"]
            try:
                username = User.objects.get(email=userinput).username
            except User.DoesNotExist:
                username = request.POST["username"]
            password = request.POST["password"]
            user = authenticate(username=username, password=password)

            if user is not None:
                login(request, user)
                messages.info(request, "You're now logged in")
                return JsonResponse({"is_user": True})
            else:
                messages.error(
                    request, "Invalid information, Please check your username or email"
                )
                return JsonResponse({"is_user": False})

        return render(request, "basic/signin.html")

    return redirect("home")


class ChangePasswordView(SuccessMessageMixin, PasswordChangeView):
    template_name = "settings/change_password.html"
    success_url = reverse_lazy("home")


def signout(request):
    if request.user.is_authenticated:
        logout(request)
        messages.info(request, "You logged out of your account")
    return redirect("home")


def profile_edit(request):
    if request.user.is_authenticated:
        user_profile = Profile.objects.get(user=request.user)
        user_model = User.objects.get(username=request.user.username)
        curPath = request.POST.get("curPath")

        if request.method == "POST":
            if not User.objects.filter(username=request.POST.get("username")).exists():
                username = request.POST.get("username")
                name = request.POST.get("name")
                bio = request.POST.get("bio")
                phone = request.POST.get("phone")
                # ----------------------
                user_model.username = username
                user_profile.name = name
                user_profile.bio = bio
                user_profile.phone = phone
                user_profile.save()
                user_model.save()
            else:
                messages.info(request, "Username already in use")
                name = request.POST.get("name")
                bio = request.POST.get("bio")
                phone = request.POST.get("phone")
                # ----------------------
                user_profile.name = name
                user_profile.bio = bio
                user_profile.phone = phone
                user_profile.save()
                return HttpResponseRedirect(curPath)
            # ----------------------
            messages.success(request, "Changes saved successfully")
            return HttpResponseRedirect(curPath)

        return render(
            request,
            "basic/profile_edit.html",
            {"user_profile": user_profile, "user_model": user_model},
        )
    return redirect("home")


def avatarEdit(request):
    if request.user.is_authenticated:
        user_profile = Profile.objects.get(user=request.user)

        if request.method == "POST":
            avatar = request.FILES.get("avatar")
            user_profile.avatar = avatar
            user_profile.save()

            messages.success(request, "Avatar successfuly saved")

        return render(request, "basic/user.html", {"user_profile": user_profile})

    return redirect("home")


def avatarDelete(request):
    user_profile = Profile.objects.get(user=request.user)
    if request.method == "POST":
        user_profile.avatar.delete()
        messages.info(request, "Avatar successfuly deleted")
    return render(request, "basic/user.html")


# ROOM
def room_detail(request, room_id):
    room = get_object_or_404(Room, id=room_id)
    
    currency = show_currency(request.session.get('currency', 'UZS'))
    
    room_converted_price = convert_price(room.currency, request.session.get('currency', 'UZS'), room.price)
    room_tot_price = convert_price(room.currency, request.session.get('currency', 'UZS'), room.tot_price())
    room_count_nights_price = convert_price(room.currency, request.session.get('currency', 'UZS'), room.count_nights_price())
    room_fee = convert_price(room.currency, request.session.get('currency', 'UZS'), room.fee())
    
    rooms = Room.objects.exclude(id=room.id).all()
    reservations = Reservation.objects.filter(room=room)
    reviews = room.rating_set.order_by("-date")
    num_o_days = (room.check_out - room.check_in).days
    return render(
        request,
        "basic/room.html",
        {
            "room": room,
            "rooms": rooms,
            "reviews": reviews,
            "num_o_days": num_o_days,
            'currency': currency, 
            'room_converted_price': room_converted_price,
            'room_tot_price': room_tot_price,
            'room_count_nights_price': room_count_nights_price,
            'room_fee': room_fee,
        },
    )
    
def room_create(request):
    regions = Region_Choices
    room_types = RoomTypes
    currency = request.session.get('currency', 'UZS')
    currencies = [
        (code, name) for code, name in Currencies if code != request.session.get('currency', 'UZS')
    ]
    
    if request.user.is_authenticated:
        if request.method == "POST":
            host = request.user

            title = request.POST.get("title")
            description = request.POST.get("description")

            address = request.POST.get("address")
            city = request.POST.get("city")
            
            cur = request.POST.get("currency")
            price = float(request.POST.get("price").replace(",", ""))
            
            if price.is_integer():
                price = int(price)
            
            guests = request.POST.get("guests")
            beds = request.POST.get("beds")
            bedrooms = request.POST.get("bedrooms")
            baths = request.POST.get("baths")

            check_in = request.POST.get("check_in")
            check_out = request.POST.get("check_out")

            room_type = request.POST.get("room_type")
            amenities = [
                am
                for am in (request.POST.get("amenities")).split(",")
                if am.strip() != ""
            ]
            house_rules = [
                hr
                for hr in (request.POST.get("house_rules")).split(",")
                if hr.strip() != ""
            ]

            latitude = request.POST.get("latitude")
            longitude = request.POST.get("longitude")
            location = f"{latitude},{longitude}"

            # Create Room instance
            room = Room.objects.create(
                host=host,
                title=title,
                description=description,
                city=city,
                currency=cur,
                price=price,
                address=address,
                guests=guests,
                beds=beds,
                bedrooms=bedrooms,
                baths=baths,
                location=location,
                check_in=check_in,
                check_out=check_out,
                room_type=room_type,
            )

            for file in request.FILES.getlist("images"):
                img = Image.objects.create(file=file)
                room.images.add(img)

            for am in amenities:
                # Check if amenity already exists
                existing_amenity = Amenity.objects.filter(name=string.capwords(am)).first()
                if existing_amenity:
                    room.amenities.add(existing_amenity)
                else:
                    new_amenity = Amenity.objects.create(name=string.capwords(am))
                    room.amenities.add(new_amenity)

            for hr in house_rules:
                # Check if amenity already exists
                existing_houserule = HouseRule.objects.filter(rule=string.capwords(hr)).first()
                if existing_houserule:
                    room.house_rules.add(existing_houserule)
                else:
                    new_houserule = HouseRule.objects.create(rule=string.capwords(hr))
                    room.house_rules.add(new_houserule)

            # Return the room ID in a JSON response
            return JsonResponse({"room_id": room.pk})

            # return redirect("room_detail_url", room_id=room.pk)
        return render(
            request,
            "basic/room_create.html",
            {"regions": regions, "room_types": room_types, "currency": currency, "currencies": currencies},
        )
    return redirect("signin")


def room_delete(request, id):
    room = Room.objects.get(id__exact=id)
    if request.user == room.host:
        if request.method == "POST":
            room.delete()
            return redirect("user_profile", request.user)
    return redirect("home")


def room_edit(request, username, id):
    room = Room.objects.get(pk=id)
    currency = show_currency(request.session.get('currency', 'UZS'))
    room.converted_price = convert_price(room.currency, request.session.get("currency", "UZS"), room.price)

    cur_city = room.city.capitalize()
    cur_rmtype = room.room_type.capitalize()

    # Remove the current city and room type from the list of options
    currencies = [
        (code, name) for code, name in Currencies if code != room.currency
    ]
    regions = [
        (code, name) for code, name in Region_Choices if code.lower() != cur_city.lower()
    ]
    room_types = [
        (code, name) for code, name in RoomTypes if code.lower() != cur_rmtype.lower()
    ]

    amenities = room.amenities.all()
    house_rules = room.house_rules.all()

    context = {
        "room": room,
        "cur_city": cur_city,
        "cur_rmtype": cur_rmtype,
        "regions": regions,
        "room_types": room_types,
        "amenities": amenities,
        "house_rules": house_rules,
        "currencies": currencies,
        "currency": currency
    }

    if room.host.username == username:
        if request.method == "POST":
            room.title = request.POST.get("title", room.title)
            room.description = request.POST.get("description", room.description)
            
            room.currency = request.POST.get("currency", room.currency)
            room.price = float(request.POST.get("price", room.price).replace(",", ""))
            
            if room.price.is_integer():
                room.price = int(room.price)

            room.city = request.POST.get("city", room.city)
            room.room_type = request.POST.get("room_type", room.room_type)
            room.address = request.POST.get("address", room.address)

            room.guests = request.POST.get("guests", room.guests)
            room.beds = request.POST.get("beds", room.beds)
            room.bedrooms = request.POST.get("bedrooms", room.bedrooms)
            room.baths = request.POST.get("baths", room.baths)

            for file in request.FILES.getlist("images"):
                img = Image.objects.create(file=file)
                room.images.add(img)

            # Clear existing amenities and add new ones
            room.amenities.clear()
            new_amenities = [
                am.strip() for am in request.POST.get("amenities").split(",") if am.strip()
            ]
            for am in new_amenities:
                existing_amenity = Amenity.objects.filter(name=string.capwords(am)).first()
                if existing_amenity:
                    room.amenities.add(existing_amenity)
                else:
                    new_amenity = Amenity.objects.create(name=string.capwords(am))
                    room.amenities.add(new_amenity)

            # Clear existing house rules and add new ones
            room.house_rules.clear()
            new_house_rules = [
                hr.strip() for hr in request.POST.get("house_rules").split(",") if hr.strip()
            ]
            for hr in new_house_rules:
                existing_houserule = HouseRule.objects.filter(rule=string.capwords(hr)).first()
                if existing_houserule:
                    room.house_rules.add(existing_houserule)
                else:
                    new_houserule = HouseRule.objects.create(rule=string.capwords(hr))
                    room.house_rules.add(new_houserule)

            room.check_in = request.POST.get("check_in", room.check_in)
            room.check_out = request.POST.get("check_out", room.check_out)

            # room.room_type = request.POST.get("room_type", room.room_type)
            room.location = f'{request.POST.get("latitude", room.fst_loc)},{request.POST.get("longitude", room.sec_loc)}'

            room.save()

            return JsonResponse({"username": request.user.username})

        return render(request, "basic/room_edit.html", context)
    return redirect("home")


# RATING
def rating_create(request, id):
    room = Room.objects.get(id__exact=id)
    curPath = request.POST.get("curPath")
    if request.user.is_authenticated:
        if request.method == "POST":
            user = request.user
            text = request.POST["text"]

            rating = room.rating_set.create(author=user, text=text)
            rating.save()

            return HttpResponseRedirect(curPath)
        return HttpResponseRedirect(curPath)
    return redirect("signin")


def rating_delete(request, id, pk):
    room = Room.objects.get(id__exact=id)
    rating = room.comment_set.get(pk=pk)
    currentPage = request.POST.get("currentPage")
    if request.user.id == rating.author.id:
        if request.method == "POST":
            rating.delete()
    else:
        return HttpResponseRedirect(currentPage)
    return HttpResponseRedirect(currentPage)


def rating_edit(request, id, pk):
    room = Room.objects.get(id__exact=id)
    rating = room.rating_set.get(pk=pk)
    currentPage = request.POST.get("currentPage")
    if request.user.id == rating.author.id:
        if request.method == "POST":
            text = request.POST.get("text")
            if request.POST.get("text") != rating.text:
                rating.text = text
                rating.edited = True
                rating.save()
                messages.info(request, "Your rating has been edited")
            else:
                return HttpResponseRedirect(currentPage)
        return HttpResponseRedirect(currentPage)
    return HttpResponseRedirect(currentPage)


# OTHER
@csrf_exempt
def img_delete(request, img_id):
    if request.method == 'POST':
        img = get_object_or_404(Image, id=img_id)
        img.delete()
        return JsonResponse({'success': True})
    else:
        return redirect("user_detail", request.user)


def search(request):
    query = request.GET.get("search")
    if query == "":
        return redirect("home")
    else:
        users = User.objects.filter(Q(username__contains=query))
        context = {"query": query, "users": users}
        return render(request, "basic/search.html", context)


def savePost(request, id, slug):
    room = Room.objects.get(id__exact=id, slug__exact=slug)
    if request.method == "POST":
        if request.user.is_authenticated:
            if not room.savep_set.filter(user=request.user).exists():
                room.savep_set.create(user=request.user)
                messages.success(request, "Room saved to bookmarks")
            else:
                saveRP = request.user.savep_set.get(room=room)
                saveRP.delete()
                messages.info(request, "Room has been unsaved")
        else:
            return redirect("signin")
    return redirect("home")


def bookmarks(request):
    bookmarks = RoomSave.objects.all()
    return render(request, "basic/bookmarks.html", {"bookmarks": bookmarks})


def share(request):
    if request.method == "POST":
        messages.success(request, "Link successfuly copied")
    return render(request, "basic/home.html")


def tou(request):
    return render(request, "other/tou.html")

def set_language(request):
    user_language = request.GET.get('language')
    if user_language:
        translation.activate(user_language)
        response = redirect(request.META.get('HTTP_REFERER', '/'))
        response.set_cookie(settings.LANGUAGE_COOKIE_NAME, user_language)
        return response
    else:
        return redirect('/')
        
def set_currency(request):
    currency = request.GET.get('currency', 'UZS')
    request.session['currency'] = currency
    return redirect(request.META.get('HTTP_REFERER', '/'))

def convert_price(from_cur, to_cur, price):
    if from_cur == to_cur:
        return "{:,}".format(price)
    try:
        bef = convert(from_cur, to_cur, price)[1:-1]
        aft = dict((k.strip()[1:-1], v.strip()) for k,v in (item.split(':') for item in bef.split(',')))["amount"]
        aft = aft.replace('"', "")

        return "{:,}".format(float(aft))
    except:
        return None
        
def show_currency(cur):
    if cur == "USD":
        return "$"
    elif cur == "RUB":
        return "₽"
    elif cur == "GBP":
        return "₤"
    elif cur == "JPY":
        return "¥"

    return cur + " "