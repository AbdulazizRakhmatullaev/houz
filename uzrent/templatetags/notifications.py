from django.template import Library
from uzrent.models import Notifications

register = Library()


@register.inclusion_tag("temps/notifications.html")
def notifications(request):
    notifications = Notifications.objects.filter(reciever=request.user).order_by(
        "-created_at"
    )
    return {"notifications": notifications}
