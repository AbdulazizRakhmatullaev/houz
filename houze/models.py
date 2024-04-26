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
    created_at = models.DateTimeField("Created at", default=datetime.now)

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

    def my_rating(self):
        avg = Rating.objects.filter(user=self.user).aggregate(Avg("rating"))[
            "rating__avg"
        ]
        if avg is not None:
            return round(avg, 1)
        else:
            return 0.0

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


class Image(models.Model):
    file = models.FileField(upload_to="room/images")
    # room = models.ForeignKey("Room", related_name="photos", on_delete=models.CASCADE)

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
    location = PlainLocationField(based_fields=["city"], zoom=7, max_length=255)
    date = models.DateTimeField("Date", default=datetime.now)

    class Meta:
        verbose_name = "Room"
        verbose_name_plural = "Rooms"
        ordering = ["-date"]

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

    def fee(self):
        fee = 0.33 * self.price
        return f"{fee:,.3f}"

    def num_o_days(self):
        return (self.check_out - self.check_in).days

    def get_price(self):
        return f"{self.price:,.3f}"

    def count_nights_price(self):
        days = (self.check_out - self.check_in).days
        total_price = days * self.price
        return f"{total_price:,.3f}"

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


class Booking(models.Model):
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
        svg = """<svg xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 16 16">
                                <path
                                    d="m5.7532 3.8663-.431.997c-.0302.0696-.0452.1044-.0686.1315a.2315.2315 0 0 1-.0747.057c-.0322.0154-.0697.0207-.1446.0314l-.6268.0887c-1.766.25-2.649.3751-3.0205.7887a1.5313 1.5313 0 0 0-.362 1.3233c.109.5455.805 1.104 2.197 2.221l.2366.1898c.0631.0507.0947.076.1152.108a.2318.2318 0 0 1 .0344.0934c.0052.0376-.0023.0774-.0173.157l-.0709.3745c-.3894 2.0586-.584 3.0878-.2774 3.5907a1.5262 1.5262 0 0 0 1.2391.731c.5878.0247 1.3921-.6449 3.0007-1.9843l.2762-.23c.0842-.0701.1263-.1052.1732-.1186a.2312.2312 0 0 1 .1268 0c.047.0134.089.0485.1732.1186l.2763.23c1.6085 1.3394 2.4128 2.009 3.0006 1.9843a1.5263 1.5263 0 0 0 1.2392-.731c.3066-.5029.1119-1.5321-.2775-3.5907l-.0708-.3745c-.0151-.0796-.0226-.1194-.0174-.157a.232.232 0 0 1 .0344-.0934c.0205-.032.0521-.0573.1152-.108l.2367-.1899c1.3919-1.117 2.0879-1.6754 2.197-2.2209a1.5313 1.5313 0 0 0-.3621-1.3233c-.3715-.4136-1.2545-.5386-3.0205-.7887l-.6267-.0887c-.075-.0107-.1124-.016-.1447-.0314a.231.231 0 0 1-.0746-.057c-.0235-.027-.0385-.0619-.0686-.1314l-.4311-.9971c-.7075-1.6365-1.0613-2.4548-1.5574-2.704a1.5248 1.5248 0 0 0-1.3691 0c-.4962.2492-.85 1.0675-1.5575 2.704Z" />
                            </svg>"""
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


class RatingLike(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.ForeignKey(Rating, on_delete=models.CASCADE)
    date = models.DateTimeField(default=datetime.now)


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
