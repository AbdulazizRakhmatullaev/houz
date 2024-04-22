from . import views
from django.urls import path, URLPattern

urlpatterns = [
    # CRUCIALS
    path("", views.home, name="home"),
    path("signup", views.signup, name="signup"),
    path("signin", views.signin, name="signin"),
    path("signout", views.signout, name="signout"),
    # SETTINGS
    path("settings/profile", views.editProfile, name="editProfile"),
    path("settings/profile/avatar", views.avatarEdit, name="avatarEdit"),
    path("settings/profile/avatar/delete", views.avatarDelete, name="ppDelete"),
    # roomING
    path("room/create", views.room_create, name="room_create"),
    path("rooms/<int:id>/edit", views.room_edit, name="room_edit"),
    path("room/<int:id>/delete", views.room_delete, name="room_delete"),
    path("room/<str:id>/edit", views.room_edit, name="post_edit"),
    path("rooms/<str:room_id>", views.room_detail, name="room_detail_url"),
    path("rooms/<str:room_id>/book", views.book_room, name="book_room"),
    # ratingING
    path(
        "post/<str:post_id>/rating/<str:rating_id>/like",
        views.rating_like_unlike,
        name="rating_like_unlike",
    ),
    path("room/<str:id>/rating", views.rating_create, name="rating_create"),
    path(
        "room/<str:id>/rating/<int:pk>/delete",
        views.rating_delete,
        name="rating_delete",
    ),
    path("room/<str:id>/rating/<int:pk>/edit", views.rating_edit, name="rating_edit"),
    # Other
    path("search/", views.search, name="search"),
    path("bookmarks", views.bookmarks, name="bookmarks"),
    path("booking/", views.booking, name="booking"),
    path(
        "bookings/<int:booking_id>/delete", views.booking_delete, name="booking_delete"
    ),
    path("notifications/<int:noty_id>/delete", views.noty_delete, name="noty_delete"),
    path("room/confirm/<int:noty_id>", views.confirm_room, name="confirm_room"),
    path("@<str:username>", views.user_profile, name="user_profile"),
]
