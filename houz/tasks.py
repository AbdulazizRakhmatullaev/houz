from celery import shared_task
from .utils import convert_price

@shared_task
def convert_prices_task(from_cur, to_cur, price):
    return convert_price(from_cur, to_cur, price)