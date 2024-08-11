from django.contrib import admin
from .models import *


class Profile_list(admin.ModelAdmin):
    list_display = ["user", "name", "email", "phone_number"]

class Currency_list(admin.ModelAdmin):
    list_display = ["from_currency", "to_currency", "value", "date_updated"]

class saveAs(admin.ModelAdmin):
    save_as = True


admin.site.register(Profile, Profile_list)
admin.site.register(Rating, saveAs)
admin.site.register(Room, saveAs)
admin.site.register(Image)
admin.site.register(Amenity)
admin.site.register(HouseRule)
admin.site.register(Notification)
admin.site.register(Reservation)
admin.site.register(Comment)
admin.site.register(ExchangeRate, Currency_list)
