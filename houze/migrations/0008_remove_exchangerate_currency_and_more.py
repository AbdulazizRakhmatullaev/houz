# Generated by Django 5.0.3 on 2024-07-02 13:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('houze', '0007_room_currency'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='exchangerate',
            name='currency',
        ),
        migrations.RemoveField(
            model_name='exchangerate',
            name='rate_to_uzs',
        ),
        migrations.AddField(
            model_name='exchangerate',
            name='from_currency',
            field=models.CharField(default='UZS', max_length=3, verbose_name='from_currency'),
        ),
        migrations.AddField(
            model_name='exchangerate',
            name='to_currency',
            field=models.CharField(default='USD', max_length=3, verbose_name='to_currency'),
        ),
        migrations.AddField(
            model_name='exchangerate',
            name='value',
            field=models.FloatField(default=1, verbose_name='Value'),
        ),
    ]
