from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.shortcuts import reverse
import random
from datetime import datetime
from django_countries.fields import CountryField
from django.db.models import Avg
from django.core.validators import MaxValueValidator, MinValueValidator

class RangedIntegerField(models.IntegerField):
    def __init__(self, min_value=None, max_value=None, **kwargs):
        self.min_value = min_value
        self.max_value = max_value
        if "validators" in kwargs:
            validators = kwargs["validators"]
        else:
            validators = []
        if min_value:
            validators.append(MinValueValidator(min_value))
        if max_value:
            validators.append(MaxValueValidator(max_value))
        kwargs["validators"] = validators
        super(RangedIntegerField, self).__init__(**kwargs)

    def formfield(self, **kwargs):
        context = {"min_value": self.min_value, "max_value": self.max_value}
        context.update(kwargs)
        return super(RangedIntegerField, self).formfield(**context)


def avatarColorDefault():
    position = [
        "to bottom right",
        "to bottom left",
        "to top right",
        "to top left",
        "to left",
        "to right",
        "to top",
        "to bottom",
    ]
    first_colors = [
        "#00ec7b",
        "#00cb00",
        "#2e91f5",
        "#a750ff",
        "#acacac",
        "#f3e03d",
        "#eb1606",
        "#009688",
        "#00b8ff",
        "#ffa600",
        "#d9b7e9",
        "#ffbdbd",
    ]
    second_colors = [
        "#0075ff",
        "#fdee2d",
        "#7115a3",
        "#0bff00",
        "#d01212",
        "#f3e03d",
        "#eb1606",
        "#ffffff",
        "#00b8ff",
        "#ffa600",
        "#24028e",
        "#ffbdbd",
    ]
    combines = [
        random.choice(position)
        + ", "
        + random.choice(first_colors)
        + ", "
        + random.choice(second_colors)
    ]
    return random.choice(combines)


Region_Choices = (
    ("TASHKENT", "Tashkent"),
    ("ANDIJAN", "Andijan"),
    ("BUKHARA", "Bukhara"),
    ("FERGANA", "Fergana"),
    ("JIZZAKH", "Jizzakh"),
    ("NAMANGAN", "Namangan"),
    ("NAVOIY", "Navoiy"),
    ("KARSHI", "Karshi"),
    ("SAMARKAND", "Samarkand"),
    ("GULISTON", "Guliston"),
    ("TERMEZ", "Termez"),
    ("NURAFSHON", "Nurafshon"),
    ("URGENCH", "Urgench"),
    ("NUKUS", "Nukus"),
)


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, max_length=10)
    avatar = models.ImageField("Avatar", blank=True, upload_to="users/avatars/%Y/%m/%d")
    avatar_default = models.CharField(
        "Default Avatar", max_length=255, default=avatarColorDefault
    )
    name = models.CharField("Name", max_length=255)
    bio = models.CharField("Bio", max_length=255, blank=True)
    email = models.EmailField("Email", max_length=255)
    phone_number = models.CharField("Phone", max_length=255, blank=True, null=True)
    country = models.CharField(
        max_length=200,
        null=True,
        choices=CountryField().choices + [("", "Select Country")],
    )
    created_at = models.DateTimeField("Created at", default=timezone.now)

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

    def __str__(self):
        return self.user.username


class RoomType(models.Model):

    name = models.CharField("Room Type Name", max_length=255)

    class Meta:
        verbose_name = "Room Type"
        verbose_name_plural = "Room Types"

    def __str__(self):
        return self.name


class Amenity(models.Model):

    name = models.CharField("Name", max_length=255)

    class Meta:
        verbose_name = "Amenity"
        verbose_name_plural = "Amenities"

    def __str__(self):
        return self.name


class HouseRule(models.Model):

    rule = models.CharField("Rule", max_length=255)

    class Meta:
        verbose_name = "House Rule"
        verbose_name_plural = "House Rules"

    def __str__(self):
        return self.rule


class Photo(models.Model):
    file = models.ImageField(upload_to="room_photos")
    room = models.ForeignKey("Room", related_name="photos", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Photo"
        verbose_name_plural = "Photos"

    def __str__(self):
        return "Photo of the object: " + str(self.room)


class Room(models.Model):
    host = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="User")
    brief_name = models.CharField(max_length=150, null=True)
    description = models.TextField("Description")
    city = models.CharField(
        max_length=200, null=True, choices=Region_Choices, default="Tashkent"
    )
    price = models.IntegerField("Price")
    address = models.CharField(max_length=255)
    guests = models.IntegerField("Guests")
    beds = models.IntegerField("Beds")
    bedrooms = models.IntegerField("Bedrooms")
    baths = models.IntegerField("Baths")
    check_in = models.DateField("Check in")
    check_out = models.DateField("Check out")
    room_type = models.ForeignKey(
        "RoomType", related_name="rooms", on_delete=models.SET_NULL, null=True
    )
    amenities = models.ManyToManyField(Amenity, related_name="rooms", blank=True)
    house_rules = models.ManyToManyField(HouseRule, related_name="rooms", blank=True)
    date = models.DateTimeField("Date", default=datetime.now)

    class Meta:
        verbose_name = "Room"
        verbose_name_plural = "Rooms"
        ordering = ["-date"]

    def get_dates(self):
        if self.check_in.month == self.check_in.month:
            return (
                str(self.date.strftime("%b"))
                + " "
                + str(self.check_in.day)
                + " - "
                + str(self.check_out.day)
            )
        else:
            return (
                str(self.date.strftime("%b"))
                + " "
                + str(self.check_in.day)
                + " - "
                + self.check_in.month
                + str(self.check_out.day)
            )

    def get_absolute_url(self):
        return reverse("room_detail_url", kwargs={"slug": self.slug, "id": self.id})

    def ratings_count(self) -> float:
        rating_num = Rating.objects.filter(room=self).count()
        return rating_num

    def average_rating(self) -> float:
        rating_avg = Rating.objects.filter(room=self).aggregate(Avg("rating"))[
            "rating__avg"
        ]
        if rating_avg is not None:
            return round(rating_avg, 1)
        else:
            return 0.0

    def first_photo(self):
        try:
            (photo,) = self.photos.all()[:1]
            return photo.file.url
        except Exception:
            return None

    def four_photos(self):
        photos = self.photos.all()[:4]
        return photos

    def left_photos(self):
        photos = self.photos.all()[5:]
        return photos

    def __str__(self):
        return (
            str(self.id)
            + " | "
            + "@"
            + self.host.username
            + " | "
            + (self.city + " ")
            + " | "
            + str(self.date.strftime("%Y-%m-%d"))
        )


class RoomSave(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Room, on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now)


class Rating(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="User")
    room = models.ForeignKey(Room, on_delete=models.CASCADE, verbose_name="Room")
    review_text = models.TextField("Review text")
    rating = RangedIntegerField(default=1, min_value=1, max_value=5)
    date = models.DateTimeField("Date", default=timezone.now)
    edited = models.BooleanField("Edited", default=False)

    class Meta:
        verbose_name = "Rating"
        verbose_name_plural = "Rating"

    def get_date(self):
        time = datetime.now()
        if self.date.day == time.day:
            if self.date.hour == time.hour:
                if self.date.minute == time.minute:
                    return "now"
                else:
                    return str(time.minute - self.date.minute) + "m"
            else:
                return str(time.hour - self.date.hour) + "h"
        elif self.date.month == time.month and self.date.day != time.day:
            return str(self.date.strftime("%b")) + " " + str(self.date.day)

    def __str__(self):
        return (
            self.user.username
            + " | "
            + str(self.rating)
            + " | "
            + self.date.strftime("%Y-%m-%d")
        )


class RatingLike(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.ForeignKey(Rating, on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now)
