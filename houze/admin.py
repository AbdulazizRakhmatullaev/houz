from django.contrib import admin
from .models import *


class Profile_list(admin.ModelAdmin):
    list_display = ["user", "name", "phone_number"]


class saveAs(admin.ModelAdmin):
    save_as = True


admin.site.register(Profile, Profile_list)
admin.site.register(Rating, saveAs)
admin.site.register(Room, saveAs)
admin.site.register(Image)
admin.site.register(Amenity)
admin.site.register(HouseRule)
admin.site.register(RoomType)
admin.site.register(Notification)
admin.site.register(Booking)
admin.site.register(Comment)
