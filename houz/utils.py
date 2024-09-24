import requests
from decimal import Decimal
from django.core.cache import cache
from houz.models import ExchangeRate
from bs4 import BeautifulSoup

def scrape_and_cache_exchange_rates():
    url = "https://cbu.uz/ru/"
    html_txt = requests.get(url).text
    soup = BeautifulSoup(html_txt, "html.parser")
    tags = soup.find_all("div", class_="exchange__item_value")

    # Google Finance USD to UZS conversion
    google_url = "https://www.google.com/finance/quote/USD-UZS?sa=X&ved=2ahUKEwiEyfKknK39AhVLRvEDHfLBAQMQ_AUoAXoECAEQAw"
    ge = requests.get(google_url, timeout=3).text
    gesoup = BeautifulSoup(ge, "html.parser")
    uzs_atr = gesoup.find("div", class_="YMlKec fxKbKc").text.replace(",", '')[:5]

    # Dictionary to store rates with UZS as the base currency
    dt = {"USD": Decimal(uzs_atr)}

    # Parse cbu.uz for other currency rates
    for tag in tags:
        name = str(tag.text[:3])
        rate = Decimal(tag.text[5:])
        dt[name] = rate
        
    try:
        for currency, rate in dt.items():
            # Update the DB and cache
            ExchangeRate.objects.update_or_create(from_currency=currency, to_currency='UZS', defaults={'value': rate})
            cache.set(f"UZS_{currency}_rate", rate, timeout=60*60)  # Cache for 1 hour
            
    except Exception as e:
        print(f"Error updating exchange rates: {e}")

def get_conversion_rate(from_currency, to_currency):
    if from_currency == to_currency:
        return Decimal(1)
    
    # Fetch rates from cache or DB
    uzs_to_from_rate = cache.get(f"UZS_{from_currency}_rate")
    uzs_to_to_rate = cache.get(f"UZS_{to_currency}_rate")
    
    if uzs_to_from_rate is None or uzs_to_to_rate is None:
        try:
            uzs_to_from_rate = ExchangeRate.objects.get(from_currency=from_currency, to_currency='UZS').value
            uzs_to_to_rate = ExchangeRate.objects.get(from_currency=to_currency, to_currency='UZS').value
            cache.set(f"UZS_{from_currency}_rate", uzs_to_from_rate, timeout=60*60)
            cache.set(f"UZS_{to_currency}_rate", uzs_to_to_rate, timeout=60*60)
        except ExchangeRate.DoesNotExist:
            return None
    
    # Convert between currencies using UZS as a pivot
    conversion_rate = Decimal(uzs_to_to_rate) / Decimal(uzs_to_from_rate)
    return conversion_rate

def convert_price(from_currency, to_currency, amount):
    rate = get_conversion_rate(from_currency, to_currency)
    if rate is None:
        return None
    return round(Decimal(amount) * rate, 2)
