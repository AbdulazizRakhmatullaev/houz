from django import template
from uzrent.models import Notification

register = template.Library()


@register.inclusion_tag("temps/notifications.html")
def notifications(request):
    notifications = Notification.objects.filter(reciever=request.user).order_by(
        "-created_at"
    )
    return {
        "notifications": notifications,
        "websocket_enabled": True, # Flag to indicate WebSocket functionality is enabled
    }