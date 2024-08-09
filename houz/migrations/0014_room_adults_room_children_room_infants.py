# Generated by Django 5.0.3 on 2024-08-09 01:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houz', '0013_remove_room_is_pets_room_pets'),
    ]

    operations = [
        migrations.AddField(
            model_name='room',
            name='adults',
            field=models.IntegerField(default=1, verbose_name='Adults'),
        ),
        migrations.AddField(
            model_name='room',
            name='children',
            field=models.IntegerField(default=0, verbose_name='Children'),
        ),
        migrations.AddField(
            model_name='room',
            name='infants',
            field=models.IntegerField(default=0, verbose_name='Infants'),
        ),
    ]
