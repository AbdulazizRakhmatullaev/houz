from django.contrib import admin
from .models import *


class Profile_list(admin.ModelAdmin):
    list_display = ["user", "name", "phone_number"]


admin.site.register(Profile, Profile_list)
admin.site.register(Rating)
admin.site.register(Room)
admin.site.register(Photo)
admin.site.register(Amenity)
admin.site.register(HouseRule)
admin.site.register(RoomType)