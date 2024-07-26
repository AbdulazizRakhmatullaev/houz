from google_currency import convert
from django.core.cache import cache

no_cents_currencies = {"UZS", "JPY", "CNY", "RUB"}

def get_conversion_rate(from_cur, to_cur):
    cache_key = f"{from_cur}_{to_cur}_rate"
    rate = cache.get(cache_key)
    if not rate:
        try:
            response = convert(from_cur, to_cur, 1)
            data = dict((k.strip()[1:-1], v.strip()) for k, v in (item.split(':') for item in response[1:-1].split(',')))
            rate = float(data["amount"].replace('"', ''))
            cache.set(cache_key, rate, timeout=60*60)  # Cache for 1 hour
        except:
            return None
    return rate

def convert_price(from_cur, to_cur, price):
    if from_cur == to_cur:
        if from_cur in no_cents_currencies:
            return "{:,}".format(int(price))
        else:
            return "{:,.2f}".format(price)
    try:
        rate = get_conversion_rate(from_cur, to_cur)
        if rate is None:
            return None
        converted_price = price * rate
        converted_price = round(converted_price, 2)
        
        if to_cur in no_cents_currencies:
            # Remove trailing zeros for currencies without cents
            converted_price = int(converted_price)
            return "{:,}".format(converted_price)
        else:
            return "{:,.2f}".format(converted_price)
    except:
        return None
