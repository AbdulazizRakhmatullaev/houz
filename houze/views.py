from .models import (
    Room,
    Profile,
    Rating,
    RatingLike,
    Bookmark,
    Notification,
    Booking,
    Image,
    HouseRule,
    Amenity,
    Region_Choices,
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
import json
from django.core.serializers.json import DjangoJSONEncoder
from django.template.loader import render_to_string

import os
from django.conf import settings


# webscoket
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync


def home(request):
    rooms = Room.objects.all()
    return render(request, "basic/home.html", {"rooms": rooms})


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


def booking(request):
    bookings = Booking.objects.filter(room__host=request.user).order_by("-created_at")
    return render(request, "basic/booking.html", {"bookings": bookings})


def booking_delete(request, booking_id):
    booking = Booking.objects.get(pk=booking_id)
    if request.method == "POST":
        if request.user == booking.room.host:

            tolerance_window = timedelta(seconds=5)
            start_time = booking.created_at - tolerance_window
            end_time = booking.created_at + tolerance_window

            noty = Notification.objects.filter(
                reciever=request.user,
                created_at__gte=start_time,
                created_at__lte=end_time,
            )

            noty.delete()

            # notify about cancellation
            not_msg = f'Sorry, but the booking for <a class="roomUrl" href="/rooms/{booking.room.id}" class="underline" style="color: #06c;">this</a> room has been cancelled by the host'
            create_notification(
                sender=request.user,
                reciever=booking.user,
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

            booking.delete()

            return redirect("booking")
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
                    if not Booking.objects.filter(
                        user=request.user,
                        room=room,
                        check_in=check_in,
                        check_out=check_out,
                    ).exists():
                        if not Notification.objects.filter(
                            sender=request.user, room=room
                        ).exists():
                            not_message = f'Hi, I would like to book your <a class="roomUrl" href="/rooms/{room.id}" class="underline" style="color: #06c;">room</a>'

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
                            return redirect("home")
                        else:
                            messages.info(
                                request,
                                "Please have some respect and patience, if host is not responding to notification, give him a call",
                            )
                    else:
                        messages.info(
                            request,
                            "You already booked the same room with the same dates",
                        )
                else:
                    messages.info(request, "Chosen dates are incorrect")
            else:
                # If dates are not within the available range, display error
                messages.info(
                    request, "Selected dates are not within the available range."
                )
        else:
            messages.info(request, "You can't book your own room")
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

            if not Booking.objects.filter(
                room=room, check_in=noty_check_in, check_out=noty_check_out
            ).exists():
                not_message = f"Thank you for booking our room, we will be waiting for you on {noty_check_in}"

                Booking.objects.create(
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

                return redirect("booking")
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
    rooms = user.room_set.all().order_by("-date")
    reviews = Rating.objects.filter(room__in=rooms).order_by("-date")
    return render(
        request, "basic/user.html", {"user": user, "rooms": rooms, "reviews": reviews}
    )


def signup(request):
    if not request.user.is_authenticated:
        if request.method == "POST":
            username = request.POST["username"]
            name = request.POST["name"]
            email = request.POST["email"]
            password = request.POST["password"]
            confirm = request.POST["confirm"]

            if len(password) >= 8:
                if password == confirm:
                    if User.objects.filter(username=username).exists():
                        messages.error(request, "This Username is taken. Try again")
                        return redirect("signup")

                    elif User.objects.filter(email=email).exists():
                        messages.error(request, "This Email is taken. Try again")
                        return redirect("signup")

                    else:
                        user = User.objects.create_user(
                            username=username,
                            first_name=name,
                            email=email,
                            password=password,
                        )
                        user.save()

                        # create Profile
                        user_model = User.objects.get(username=username)
                        new_profile = Profile.objects.create(
                            user=user_model, name=name, email=email
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
                return redirect("home")
            else:
                messages.error(
                    request, "Invalid information, Please check your username or email"
                )

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


def editProfile(request):
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
            "basic/user.html",
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


# ROOM POST VIEWS
def room_create(request):
    regions = Region_Choices
    if request.user.is_authenticated:
        if request.method == "POST":
            host = request.user

            title = request.POST.get("title")
            description = request.POST.get("description")

            city = request.POST.get("city")
            price = request.POST.get("price")
            address = request.POST.get("address")

            guests = request.POST.get("guests")
            beds = request.POST.get("beds")
            bedrooms = request.POST.get("bedrooms")
            baths = request.POST.get("baths")

            check_in = request.POST.get("check_in")
            check_out = request.POST.get("check_out")

            room_type_id = request.POST.get("room_type")
            amenities = (request.POST.get("amenities")).split(",")
            house_rules = (request.POST.get("house_rules")).split(",")

            latitude = request.POST.get("latitude")
            longitude = request.POST.get("longitude")
            location = f"{latitude},{longitude}"

            # Create Room instance
            room = Room.objects.create(
                host=host,
                title=title,
                description=description,
                city=city,
                price=price,
                address=address,
                guests=guests,
                beds=beds,
                bedrooms=bedrooms,
                baths=baths,
                location=location,
                check_in=check_in,
                check_out=check_out,
                room_type_id=room_type_id,
            )

            for file in request.FILES.getlist("images"):
                img = Image.objects.create(file=file)
                room.images.add(img)

            for am in amenities:
                amy = Amenity.objects.create(name=am)
                room.amenities.add(amy)
            
            for hrn in house_rules:
                hr = HouseRule.objects.create(rule=hrn)
                room.house_rules.add(hr)

            # Return the room ID in a JSON response
            room_id = room.pk
            return JsonResponse({"room_id": room_id})

            # return redirect("room_detail_url", room_id=room.pk)
        return render(request, "basic/room_create.html", {"regions": regions})
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
    current_city = next(name for code, name in Region_Choices if code == room.city)
    regions = [(code, name) for code, name in Region_Choices if room.city != code]

    context = {"room": room, "current_city": current_city, "regions": regions}

    if room.host.username == username:
        if request.method == "POST":
            room.title = request.POST.get("title", room.title)
            room.description = request.POST.get("description", room.description)
            room.price = request.POST.get("price", room.price)

            room.city = request.POST.get("city", room.city)
            room.address = request.POST.get("address", room.address)

            room.guests = request.POST.get("guests", room.guests)
            room.beds = request.POST.get("beds", room.beds)
            room.bedrooms = request.POST.get("bedrooms", room.bedrooms)
            room.baths = request.POST.get("baths", room.baths)

            room.check_in = request.POST.get("check_in", room.check_in)
            room.check_out = request.POST.get("check_out", room.check_out)
            # room.room_type_id = request.POST.get("room_type", room.room_type_id)
            room.location = f'{request.POST.get("latitude", room.fst_loc)},{request.POST.get("longitude", room.sec_loc)}'

            room.save()

            return redirect("user_profile", request.user)
        return render(request, "basic/room_edit.html", context)
    return redirect("home")


def room_detail(request, room_id):
    room = get_object_or_404(Room, id=room_id)
    bookings = Booking.objects.filter(room=room)
    booked_dates = [
        (booking.check_in.isoformat(), booking.check_out.isoformat())
        for booking in bookings
    ]
    reviews = room.rating_set.order_by("-date")
    num_o_days = (room.check_out - room.check_in).days
    return render(
        request,
        "basic/room.html",
        {
            "room": room,
            "booked_dates": booked_dates,
            "reviews": reviews,
            "num_o_days": num_o_days,
        },
    )


def search(request):
    query = request.GET.get("search")
    if query == "":
        return redirect("home")
    else:
        users = User.objects.filter(Q(username__contains=query))
        context = {"query": query, "users": users}
        return render(request, "basic/search.html", context)


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


def rating_like_unlike(request, post_id, rating_id):
    try:
        post = get_object_or_404(Room, id=post_id)
        rating = post.rating_set.get(id=rating_id)
        user = request.user

        rating_like, created = Rating.objects.get_or_create(user=user, rating=rating)

        liked_ratings = Rating.objects.filter(ratinglike__user=user).values_list(
            "id", flat=True
        )

        if created:
            rating.likes_count += 1
        else:
            rating.likes_count -= 1
            rating_like.delete()

        rating.save()

        return JsonResponse({"likes_count": rating.likes_count, "liked": not created})

    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


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
