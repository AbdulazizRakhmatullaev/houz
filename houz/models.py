from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.shortcuts import reverse
import random
from datetime import datetime, timedelta
from django.db.models import Avg
from django.core.validators import MaxValueValidator, MinValueValidator
from location_field.models.plain import PlainLocationField
from django.utils.timezone import localtime
from .languages import LANGUAGES
from django.utils.safestring import mark_safe
from django.utils.html import escape
from django.utils.translation import gettext_lazy as _

sorted_languages = sorted(LANGUAGES, key=lambda lang: lang[1])


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

Currencies = (
    ("UZS", "UZS"),
    ("USD", "USD"),
    ("RUB", "RUB"),
    ("GBP", "GBP"),
    ("JPY", "JPY"),
    ("CHF", "CHF"),
    ("CNY", "CNY"),
)

Region_Choices = (
    (_("TASHKENT"), _("Tashkent")),
    (_("ANDIJAN"), _("Andijan")),
    (_("BUKHARA"), _("Bukhara")),
    (_("FERGANA"), _("Fergana")),
    (_("JIZZAKH"), _("Jizzakh")),
    (_("NAMANGAN"), _("Namangan")),
    (_("NAVOIY"), _("Navoiy")),
    (_("KARSHI"), _("Karshi")),
    (_("SAMARKAND"), _("Samarkand")),
    (_("GULISTON"), _("Guliston")),
    (_("TERMEZ"), _("Termez")),
    (_("NURAFSHON"), _("Nurafshon")),
    (_("URGENCH"), _("Urgench")),
    (_("NUKUS"), _("Nukus")),
)

RoomTypes = (
    (_("A ROOM"), _("A room")),
    (_("AN ENTIRE PLACE"), _("An entire place")),
    (_("A SHARED ROOM"), _("A shared room")),
)


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, max_length=10)
    avatar = models.ImageField("Avatar", blank=True, upload_to="users/avatars/%Y/%m/%d")
    avatar_default = models.CharField(
        "Default Avatar", max_length=255, default=avatarColorDefault
    )
    name = models.CharField("Name", max_length=255)
    bio = models.CharField("Bio", max_length=255, blank=True)
    email = models.EmailField("Email", max_length=255, blank=True)
    phone_number = models.CharField("Phone", max_length=255, blank=True, null=True)
    city = models.CharField(max_length=200, null=True, choices=Region_Choices)
    languages = models.CharField(
        "Languages", max_length=200, choices=sorted_languages, default="English"
    )
    created_at = models.DateTimeField("Created at", default=datetime.now)

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

    def my_rating(self):
        avg = Rating.objects.filter(room__host=self.user).aggregate(Avg("rating"))[
            "rating__avg"
        ]
        if avg is not None:
            return round(avg, 1)
        else:
            return 0.0

    def first_name(self):
        full_name = (self.name).split(" ")
        return full_name[0]

    def badge(self):
        rt = Rating.objects.filter(room__host=self.user).aggregate(Avg("rating"))[
            "rating__avg"
        ]
        if rt is None:
            return None
        elif rt == 5:
            return "Superb host"
        elif rt >= 4 and rt <= 5:
            return "Awesome host"
        elif rt >= 3 and rt <= 4:
            return "Truthworthy host"
        else:
            return None

    def __str__(self):
        return self.user.username


class Amenity(models.Model):
    icon = models.TextField("Icon svg format", blank=True)
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


class Image(models.Model):
    file = models.FileField(upload_to="room/images")
    order = models.IntegerField(default=0)

    class Meta:
        verbose_name = "Image"
        verbose_name_plural = "Images"

    def __str__(self):
        return self.file.name


class Room(models.Model):
    host = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="User")
    title = models.CharField(max_length=150, null=True)
    description = models.TextField("Description")
    images = models.ManyToManyField("Image", blank=True)
    city = models.CharField(
        max_length=200, null=True, choices=Region_Choices, default="Tashkent"
    )
    currency = models.CharField("currency", max_length=3, default="UZS", null=False)
    price = models.FloatField("Price")
    # price = MoneyField(max_digits=10, decimal_places=2, null=True, default_currency="UZS")
    address = models.CharField(max_length=255)
    guests = models.IntegerField("Guests")
    beds = models.IntegerField("Beds")
    bedrooms = models.IntegerField("Bedrooms")
    baths = models.IntegerField("Baths")
    is_pets = models.BooleanField("Pets are allowed", default=False)
    check_in = models.DateTimeField("Check in")
    check_out = models.DateTimeField("Check out")
    room_type = models.CharField(
        "Room type",
        max_length=255,
        choices=RoomTypes,
    )
    amenities = models.ManyToManyField(Amenity, related_name="rooms", blank=True)
    house_rules = models.ManyToManyField(HouseRule, related_name="rooms", blank=True)
    location = PlainLocationField(based_fields=["city"], zoom=7, max_length=255)
    date = models.DateTimeField("Date", default=datetime.now)

    class Meta:
        verbose_name = "Room"
        verbose_name_plural = "Rooms"
        ordering = ["-date"]

    def get_desc(self):
        lines = self.description.split("\n")
        rendered_lines = [
            escape(line) if line.strip() else "<br><br>" for line in lines
        ]
        return mark_safe("\n".join(rendered_lines))

    def get_dates(self):
        now = localtime()
        time_diff = now - self.date

        if time_diff.total_seconds() < 60:
            return "now"
        elif time_diff.total_seconds() < 3600:
            return f"{int(time_diff.total_seconds() // 60)}m"
        elif time_diff.days == 0:
            return f"{int(time_diff.total_seconds() // 3600)}h"
        elif time_diff.days == 1:
            return "yesterday"
        else:
            return self.date.strftime("%b ") + str(self.date.day)

    def num_o_days(self):
        return (self.check_out - self.check_in).days

    def get_price(self):
        return "{:,}".format(self.price)

    def count_nights_price(self):
        days = (self.check_out - self.check_in).days
        total_price = days * self.price
        # return "{:,}".format(total_price)
        return total_price

    def fee(self):
        days = (self.check_out - self.check_in).days
        total_price = days * self.price
        fee = 0.33 * total_price
        fee = int(fee)

        # return "{:,}".format(fee)
        return fee

    def tot_price(self):
        days = (self.check_out - self.check_in).days
        total_price = days * self.price
        fee = 0.33 * total_price
        fee = int(fee)
        # -
        days = (self.check_out - self.check_in).days
        total_price = days * self.price
        return total_price + fee

    def get_absolute_url(self):
        return reverse("room_detail_url", kwargs={"slug": self.slug, "id": self.id})

    def how_many(self):
        spr = '<span class="tspr">•</span>'
        return f"{self.guests} guests {spr} {self.bedrooms} bedrooms {spr} {self.beds} beds {spr} {self.baths} baths"

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
            image = self.images.first()
            return image.file.url
        except Exception:
            return None

    def all_photos(self):
        images = self.images.all()
        return images

    def fst_loc(self):
        txt = [i for i in self.location.split(",")]
        return txt[0]

    def sec_loc(self):
        txt = [i for i in self.location.split(",")]
        return txt[1]

    def av_dates(self):
        mi = self.check_in.strftime("%B")
        mo = self.check_out.strftime("%B")
        # days
        di = self.check_in.strftime("%d")
        do = self.check_out.strftime("%d")
        if mi == mo:
            return f"{mi} {di} – {do}"
        else:
            return f"{mi} {di} – {mo} {do}"

    def __str__(self):
        return (
            str(self.id)
            + " | "
            + "@"
            + self.host.username
            + " | "
            + ("Tashkent" + " ")
            + " | "
            + str(self.date.strftime("%Y-%m-%d"))
        )


class ExchangeRate(models.Model):
    from_currency = models.CharField("from_currency", max_length=3)
    to_currency = models.CharField("to_currency", max_length=3)
    value = models.FloatField("Value")
    date_updated = models.DateTimeField(auto_now=True)


class Reservation(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="User")
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    check_in = models.DateField("Check in")
    check_out = models.DateField("Check out")
    created_at = models.DateTimeField(default=datetime.now)

    def __str__(self):
        datetime = self.created_at.strftime("%Y-%m-%d %H:%M:%S")
        return f"id: {self.id}, on {datetime}"


class Bookmark(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Room, on_delete=models.CASCADE)
    date = models.DateTimeField(default=datetime.now)


class Rating(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="User")
    room = models.ForeignKey(Room, on_delete=models.CASCADE, verbose_name="Room")
    review_text = models.TextField("Review text")
    rating = RangedIntegerField(default=1, min_value=1, max_value=5)
    date = models.DateTimeField("Date", default=datetime.now)
    edited = models.BooleanField("Edited", default=False)

    class Meta:
        verbose_name = "Rating"
        verbose_name_plural = "Ratings"

    def user_ratings(self):
        svg = """<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>"""
        if self.rating == 1:
            return svg
        elif self.rating == 2:
            return svg * 2
        elif self.rating == 3:
            return svg * 3
        elif self.rating == 4:
            return svg * 4
        else:
            return svg * 5

    def get_date(self):
        now = localtime()
        time_diff = now - self.date

        if time_diff.total_seconds() < 60:
            return "now"
        elif time_diff.total_seconds() < 3600:
            return f"{int(time_diff.total_seconds() // 60)}m"
        elif time_diff.days == 0:
            return f"{int(time_diff.total_seconds() // 3600)}h"
        elif time_diff.days == 1:
            return "yesterday"
        else:
            return self.date.strftime("%b ") + str(self.date.day)

    def __str__(self):
        return (
            self.user.username
            + " | "
            + str(self.rating)
            + " | "
            + str(self.date)  # .strftime("%Y-%m-%d")
        )


class Notification(models.Model):
    sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name="sender")
    reciever = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="reciever"
    )
    message = models.TextField()
    room = models.ForeignKey(Room, on_delete=models.CASCADE, null=True)
    check_in = models.DateField(null=True)
    check_out = models.DateField(null=True)
    confirmed = models.BooleanField(default=False)
    created_at = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = "Notification"
        verbose_name_plural = "Notifications"

    def get_date(self):
        now = localtime()
        time_diff = now - self.created_at

        if time_diff.total_seconds() < 60:
            return "now"
        elif time_diff.total_seconds() < 3600:
            return f"{int(time_diff.total_seconds() // 60)}m"
        elif time_diff.days == 0:
            return f"{int(time_diff.total_seconds() // 3600)}h"
        elif time_diff.days == 1:
            return "yesterday"
        else:
            return self.created_at.strftime("%b ") + str(self.created_at.day)

    def __str__(self):
        datetime = self.created_at.strftime("%Y-%m-%d %H:%M:%S")
        return f"from ({self.sender}) to ({self.reciever}) on {datetime}"


class Comment(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name="author")
    reciever = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="comment_reciever"
    )
    text = models.TextField("Text")
    created_at = models.DateTimeField("Date", default=datetime.now)
    edited = models.BooleanField("Edited", default=False)

    def get_date(self):
        now = localtime()
        time_diff = now - self.created_at

        if time_diff.total_seconds() < 60:
            return "now"
        elif time_diff.total_seconds() < 3600:
            return f"{int(time_diff.total_seconds() // 60)}m"
        elif time_diff.days == 0:
            return f"{int(time_diff.total_seconds() // 3600)}h"
        elif time_diff.days == 1:
            return "yesterday"
        else:
            return self.created_at.strftime("%b ") + str(self.created_at.day)

    def __str__(self):
        return f"{self.author} to {self.reciever} text: {self.text}"
