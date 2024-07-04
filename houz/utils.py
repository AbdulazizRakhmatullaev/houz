# utils.py
from decimal import Decimal
from .models import ExchangeRate
import requests

api = "727qkWtvPmSMb7Yfbc95Mru74F1Bp4VU"

def convert_price(price, from_cur, to_cur):
    if to_cur == 'UZS':
        return "{:,}".format(price)

    try:
        amount = price
        from_currency = "UZS"
        to_currency = to_cur

        # Replace 'YOUR_API_KEY' with your actual API key
        endpoint = f'https://api.apilayer.com/exchangerates_data/latest?base={from_cur}&symbols={to_cur}&apikey={api}'

        response = requests.get(endpoint)
        data = response.json()
        conversion_rate = data['rates'][to_currency]

        converted_amount = amount * conversion_rate
        return "{:,}".format(round(converted_amount, 2))
        
        # uzs_rate = ExchangeRate.objects.get(currency="UZS").rate_to_uzs
        # target_rate = ExchangeRate.objects.get(currency=target_currency).rate_to_uzs
        # converted_price = (Decimal(price) * Decimal(target_rate) / Decimal(uzs_rate))
        # return "{:,}".format(round(converted_price, 2))
        
    except ExchangeRate.DoesNotExist:
        print(f"Exchange rate for currency {target_currency} does not exist.")
        return None
        
    except Exception as e:
        print(f"Error converting price: {e}")
        return None