# Generated by Django 5.0.2 on 2024-02-25 20:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('uzrent', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='room',
            name='facilities',
        ),
        migrations.DeleteModel(
            name='Facility',
        ),
    ]
