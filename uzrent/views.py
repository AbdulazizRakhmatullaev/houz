from .models import (
    Room,
    Profile,
    Rating,
    RatingLike,
    Bookmark,
    HostNotifications,
    UserNotifications,
    Booking,
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


def home(request):
    rooms = Room.objects.all()
    return render(request, "basic/home.html", {"rooms": rooms})


def book_room(request, room_id):
    room = Room.objects.get(pk=room_id)
    if request.method == "POST":
        check_in_str = request.POST.get("check_in")
        check_out_str = request.POST.get("check_out")

        if not check_in_str or not check_out_str:
            # Handle case where check_in or check_out is not provided
            messages.error(request, "Please provide both check-in and check-out dates.")
            return render(request, "basic/post.html", {"room": room})

        check_in = datetime.strptime(check_in_str, "%Y-%m-%d").date()
        check_out = datetime.strptime(check_out_str, "%Y-%m-%d").date()

        if room.host != request.user:
            if (
                room.check_in <= check_in < room.check_out
                and room.check_in < check_out <= room.check_out
            ):
                if check_in < check_out and check_in != check_out:
                    # check if this user already notified the owner, so he can't spam him
                    if not HostNotifications.objects.filter(
                        sender=request.user, room=room
                    ).exists():
                        HostNotifications.objects.create(
                            sender=request.user,
                            reciever=room.host,
                            check_in=check_in,
                            check_out=check_out,
                            message=f"{room.brief_name} - {room.city} - {check_in} - {check_out}",
                            room=room,
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
                    messages.info(request, "Chosen dates are incorrect")
            else:
                # If dates are not within the available range, display error
                messages.info(
                    request, "Selected dates are not within the available range."
                )
        else:
            messages.info(request, "You can't book your own room")
    return render(request, "basic/post.html", {"room": room})


def confirm_room(request, noty_id):
    notification = HostNotifications.objects.get(id=noty_id)
    room = Room.objects.get(pk=notification.room.id)

    # Check if the current user is the host of the room
    if request.method == "POST":
        action = request.POST.get("action")
        if action == "confirm":
            check_in = notification.check_in
            check_out = notification.check_out

            if not Booking.objects.filter(
                room=room, check_in=check_in, check_out=check_out
            ).exists():
                Booking.objects.create(
                    room=room, check_in=check_in, check_out=check_out
                )
                UserNotifications.objects.create(
                    reciever=notification.sender,
                    sender=request.user,
                    message=f"Thank you for booking our room, we will be waiting for you on {check_in}",
                )

                # Confirm the notification
                notification.confirmed = True
                notification.save()
            else:
                messages.info(
                    request,
                    "This room with these dates is already booked by other user",
                )
                notification.delete()
        elif action == "cancel":
            UserNotifications.objects.create(
                reciever=notification.sender,
                sender=request.user,
                message=f"Unfortunately the host declined your booked room",
            )
            notification.delete()

        return redirect("home")

    return render(
        request,
        "temps/notifications.html",
        {"room": room, "notification": notification},
    )


def user_profile(request, username):
    user = get_object_or_404(User, username__exact=username)
    return render(request, "basic/user.html", {"user": user})


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
    if request.user.is_authenticated:
        if request.method == "POST":
            user = request.user
            text = request.POST["text"]
            images = request.FILES.getlist("images")

            for image in images:
                post = Room.objects.create(
                    user=user,
                    text=text,
                    image=image,
                )

            post.save()
            return redirect("home")
        return render(request, "basic/home.html")
    return redirect("signin")


def room_delete(request, id):
    room = Room.objects.get(id__exact=id)
    if request.user.id == room.user.id:
        if request.method == "POST":
            room.delete()
            return redirect("home")
    return redirect("home")


def room_edit(request, id):
    room = Room.objects.get(id__exact=id)
    current = request.POST.get("current")
    if request.user.id == room.user.id:
        if request.method == "POST":
            text = request.POST.get("text")
            if request.POST.get("text") != room.text:
                room.text = text
                room.edited = True
                room.save()
                messages.info(request, "Your post has been edited")
            else:
                return HttpResponseRedirect(current)
        return HttpResponseRedirect(current)
    return HttpResponseRedirect(current)


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
        "basic/post.html",
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
