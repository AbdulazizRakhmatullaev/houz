# Generated by Django 5.0.3 on 2024-04-23 09:34

import datetime
import django.core.validators
import django.db.models.deletion
import houze.models
import location_field.models.plain
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Amenity',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Name')),
            ],
            options={
                'verbose_name': 'Amenity',
                'verbose_name_plural': 'Amenities',
            },
        ),
        migrations.CreateModel(
            name='HouseRule',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rule', models.CharField(max_length=255, verbose_name='Rule')),
            ],
            options={
                'verbose_name': 'House Rule',
                'verbose_name_plural': 'House Rules',
            },
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('file', models.FileField(upload_to='room/images')),
            ],
            options={
                'verbose_name': 'Image',
                'verbose_name_plural': 'Images',
            },
        ),
        migrations.CreateModel(
            name='RoomType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Room Type Name')),
            ],
            options={
                'verbose_name': 'Room Type',
                'verbose_name_plural': 'Room Types',
            },
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('avatar', models.ImageField(blank=True, upload_to='users/avatars/%Y/%m/%d', verbose_name='Avatar')),
                ('avatar_default', models.CharField(default=houze.models.avatarColorDefault, max_length=255, verbose_name='Default Avatar')),
                ('name', models.CharField(max_length=255, verbose_name='Name')),
                ('bio', models.CharField(blank=True, max_length=255, verbose_name='Bio')),
                ('email', models.EmailField(max_length=255, verbose_name='Email')),
                ('phone_number', models.CharField(blank=True, max_length=255, null=True, verbose_name='Phone')),
                ('created_at', models.DateTimeField(default=datetime.datetime.now, verbose_name='Created at')),
                ('user', models.OneToOneField(max_length=10, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Profile',
                'verbose_name_plural': 'Profiles',
            },
        ),
        migrations.CreateModel(
            name='Rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('review_text', models.TextField(verbose_name='Review text')),
                ('rating', houze.models.RangedIntegerField(default=1, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(5)])),
                ('date', models.DateTimeField(default=datetime.datetime.now, verbose_name='Date')),
                ('edited', models.BooleanField(default=False, verbose_name='Edited')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
            options={
                'verbose_name': 'Rating',
                'verbose_name_plural': 'Ratings',
            },
        ),
        migrations.CreateModel(
            name='RatingLike',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(default=datetime.datetime.now)),
                ('rating', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='houze.rating')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150, null=True)),
                ('description', models.TextField(verbose_name='Description')),
                ('city', models.CharField(choices=[('TASHKENT', 'Tashkent'), ('ANDIJAN', 'Andijan'), ('BUKHARA', 'Bukhara'), ('FERGANA', 'Fergana'), ('JIZZAKH', 'Jizzakh'), ('NAMANGAN', 'Namangan'), ('NAVOIY', 'Navoiy'), ('KARSHI', 'Karshi'), ('SAMARKAND', 'Samarkand'), ('GULISTON', 'Guliston'), ('TERMEZ', 'Termez'), ('NURAFSHON', 'Nurafshon'), ('URGENCH', 'Urgench'), ('NUKUS', 'Nukus')], default='Tashkent', max_length=200, null=True)),
                ('price', models.IntegerField(verbose_name='Price')),
                ('address', models.CharField(max_length=255)),
                ('guests', models.IntegerField(verbose_name='Guests')),
                ('beds', models.IntegerField(verbose_name='Beds')),
                ('bedrooms', models.IntegerField(verbose_name='Bedrooms')),
                ('baths', models.IntegerField(verbose_name='Baths')),
                ('check_in', models.DateField(verbose_name='Check in')),
                ('check_out', models.DateField(verbose_name='Check out')),
                ('location', location_field.models.plain.PlainLocationField(max_length=255)),
                ('date', models.DateTimeField(default=datetime.datetime.now, verbose_name='Date')),
                ('amenities', models.ManyToManyField(blank=True, related_name='rooms', to='houze.amenity')),
                ('host', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
                ('house_rules', models.ManyToManyField(blank=True, related_name='rooms', to='houze.houserule')),
                ('images', models.ManyToManyField(blank=True, to='houze.image')),
                ('room_type', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='rooms', to='houze.roomtype')),
            ],
            options={
                'verbose_name': 'Room',
                'verbose_name_plural': 'Rooms',
                'ordering': ['-date'],
            },
        ),
        migrations.AddField(
            model_name='rating',
            name='room',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='houze.room', verbose_name='Room'),
        ),
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.TextField()),
                ('check_in', models.DateField(null=True)),
                ('check_out', models.DateField(null=True)),
                ('confirmed', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
                ('reciever', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reciever', to=settings.AUTH_USER_MODEL)),
                ('sender', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sender', to=settings.AUTH_USER_MODEL)),
                ('room', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='houze.room')),
            ],
            options={
                'verbose_name': 'Notification',
                'verbose_name_plural': 'Notifications',
            },
        ),
        migrations.CreateModel(
            name='Bookmark',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(default=datetime.datetime.now)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='houze.room')),
            ],
        ),
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('check_in', models.DateField(verbose_name='Check in')),
                ('check_out', models.DateField(verbose_name='Check out')),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='houze.room')),
            ],
        ),
    ]
