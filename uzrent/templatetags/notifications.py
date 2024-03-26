from django.template import Library
from uzrent.models import HostNotifications, UserNotifications

register = Library()


@register.inclusion_tag("temps/notifications.html")
def notifications(request):
    host_nots = HostNotifications.objects.filter(
        reciever=request.user
    ).order_by("-created_at")
    user_nots = UserNotifications.objects.filter(
        reciever=request.user
    ).order_by("-created_at")
    return {
        "host_nots": host_nots,
        "user_nots": user_nots,
    }
