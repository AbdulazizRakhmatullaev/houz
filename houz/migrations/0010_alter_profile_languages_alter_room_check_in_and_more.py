# Generated by Django 5.0.3 on 2024-07-26 18:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houz', '0009_alter_profile_languages'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='languages',
            field=models.CharField(blank=True, default='English', max_length=255, verbose_name='Languages'),
        ),
        migrations.AlterField(
            model_name='room',
            name='check_in',
            field=models.DateField(verbose_name='Check in'),
        ),
        migrations.AlterField(
            model_name='room',
            name='check_out',
            field=models.DateField(verbose_name='Check out'),
        ),
    ]
