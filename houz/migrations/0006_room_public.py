# Generated by Django 5.0.3 on 2024-07-10 21:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houz', '0005_remove_profile_city_alter_profile_type_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='room',
            name='public',
            field=models.BooleanField(default=True, verbose_name='Public or not'),
        ),
    ]
