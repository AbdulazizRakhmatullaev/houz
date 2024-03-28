import json
from asgiref.sync import sync_to_async
from channels.generic.websocket import AsyncWebsocketConsumer
from django.contrib.auth.models import User  # Import the User model
from django.utils.timezone import localtime, make_aware
from datetime import datetime


class NotificationConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.group_name = "public_room"
        await self.channel_layer.group_add(self.group_name, self.channel_name)
        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(self.group_name, self.channel_name)

    async def send_notification(self, event):
        sender_id = event["sender"]
        reciever_id = event["reciever"]
        room = event["room"]
        message = event["message"]
        check_in = event["check_in"]
        check_out = event["check_out"]
        notification_id = event["notification_id"]
        profile_name = event["profile_name"]
        avatar_url = event["avatar_url"]
        avatar_default = event["avatar_default"]
        room_host = event["room_host"]
        created_at = event["created_at"]

        # Fetch sender and reciever asynchronously
        sender = await sync_to_async(User.objects.get)(id=sender_id)
        reciever = await sync_to_async(User.objects.get)(id=reciever_id)

        now = localtime()
        time_diff = now - created_at

        # Format date
        if time_diff.total_seconds() < 60:
            formatted_date = "now"
        elif time_diff.total_seconds() < 3600:
            formatted_date = f"{int(time_diff.total_seconds() // 60)}m"
        elif time_diff.days == 0:
            formatted_date = f"{int(time_diff.total_seconds() // 3600)}h"
        elif time_diff.days == 1:
            formatted_date = "yesterday"
        else:
            formatted_date = created_at.strftime("%b ") + str(created_at.day)

        # Send the notification data to the client
        await self.send(
            text_data=json.dumps(
                {
                    "sender": sender.username,
                    "reciever": reciever.username,
                    "room": room,
                    "message": message,
                    "check_in": check_in,
                    "check_out": check_out,
                    "notification_id": notification_id,
                    "profile_name": profile_name,
                    "avatar_url": avatar_url,
                    "avatar_default": avatar_default,
                    "room_host": room_host,
                    "created_at": formatted_date,
                }
            )
        )
