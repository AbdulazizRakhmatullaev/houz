# Generated by Django 5.0.3 on 2024-03-24 06:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('uzrent', '0015_alter_notifications_created_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='notifications',
            name='check_in',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='notifications',
            name='check_out',
            field=models.DateField(null=True),
        ),
    ]
