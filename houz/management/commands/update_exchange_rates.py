import requests
from bs4 import BeautifulSoup
from decimal import Decimal
from django.core.management.base import BaseCommand
from houz.models import ExchangeRate

class Command(BaseCommand):
    help = 'Update exchange rates from cbu.uz'

    def handle(self, *args, **kwargs):
        url = "https://cbu.uz/ru/"
        html_txt = requests.get(url).text
        soup = BeautifulSoup(html_txt, "html.parser")
        tags = soup.find_all("div", class_="exchange__item_value")

        ge = requests.get("https://www.google.com/finance/quote/USD-UZS?sa=X&ved=2ahUKEwiEyfKknK39AhVLRvEDHfLBAQMQ_AUoAXoECAEQAw").text
        gesoup = BeautifulSoup(ge, "html.parser")
        uzs_atr = gesoup.find("div", class_="YMlKec fxKbKc").text.replace(",", '')

        dt = {"UZS": Decimal(uzs_atr)}

        
        for name, rate in tags:
            dt[name.text] = Decimal(rate.text[3:])

        try:
            # Update or create exchange rates in the database
            for currency, rate in dt.items():
                ExchangeRate.objects.update_or_create(currency=currency, defaults={'rate_to_uzs': rate})
            
            self.stdout.write(self.style.SUCCESS('Successfully updated exchange rates from cbu.uz'))
        except Exception as e:
            self.stderr.write(self.style.ERROR(f'Error updating exchange rates: {e}'))
