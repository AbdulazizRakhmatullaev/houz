from . import views
from django.urls import path, URLPattern

urlpatterns = [
    # CRUCIALS
    path("", views.home, name="home"),
    path("signup", views.signup, name="signup"),
    path("signin", views.signin, name="signin"),
    path("signout", views.signout, name="signout"),
    # SETTINGS
    path("profile/edit", views.profile_edit, name="profile_edit"),
    # path("settings/profile/avatar", views.avatarEdit, name="avatarEdit"),
    # path("settings/profile/avatar/delete", views.avatarDelete, name="ppDelete"),
    # roomING
    path("become-a-host", views.room_create, name="room_create"),
    path("@<str:username>/rooms/<int:id>/edit", views.room_edit, name="room_edit"),
    path("room/<int:id>/delete", views.room_delete, name="room_delete"),
    path("rooms/<str:room_id>", views.room_detail, name="room_detail_url"),
    path("rooms/<str:room_id>/book", views.book_room, name="book_room"),
    path("room/image/<int:img_id>/delete", views.img_delete, name="img_delete"),
    # ratingING
    path("room/<str:id>/rating", views.rating_create, name="rating_create"),
    path(
        "room/<str:id>/rating/<int:pk>/delete",
        views.rating_delete,
        name="rating_delete",
    ),
    # Other
    path("search/", views.search, name="search"),
    path("bookmarks", views.bookmarks, name="bookmarks"),
    path("reservations/", views.reservation, name="reservation"),
    path(
        "reservations/<int:reservation_id>/delete", views.reservation_delete, name="reservation_delete"
    ),
    path("notifications/<int:noty_id>/delete", views.noty_delete, name="noty_delete"),
    path("room/confirm/<int:noty_id>", views.confirm_room, name="confirm_room"),
    path("terms-of-use", views.tou, name="tou"),
    path('set_language/', views.set_language, name='set_language'),
    #
    path("@<str:username>", views.user_profile, name="user_profile"),
    path('set_currency/', views.set_currency, name='set_currency'),
    
    path("switch-to-buyer", views.to_buyer, name="to_buyer"),
    path("switch-to-seller", views.to_seller, name="to_seller"),
    path("switch-back-to-seller", views.back_to_seller, name="back_to_seller"),
    # comment
    path("@<str:recievername>/comment", views.comment_create, name="comment_create"),
    path("comments/<int:pk>/edit", views.comment_edit, name="comment_edit"),
    path("comments/<int:pk>/delete", views.comment_delete, name="comment_delete"),
]
