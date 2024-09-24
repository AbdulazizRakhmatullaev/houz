import requests
from bs4 import BeautifulSoup
from decimal import Decimal
from django.core.management.base import BaseCommand
from houz.models import ExchangeRate

class Command(BaseCommand):
    help = 'Update exchange rates from cbu.uz and Google Finance'

    def handle(self, *args, **kwargs):
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
            # Update or create exchange rates in the database
            for currency, rate in dt.items():
                # Assuming we want to store the conversion from this currency to UZS
                ExchangeRate.objects.update_or_create(
                    from_currency=currency, to_currency="UZS", defaults={'value': rate}
                )

            self.stdout.write(self.style.SUCCESS('Successfully updated exchange rates from cbu.uz and Google Finance'))
        except Exception as e:
            self.stderr.write(self.style.ERROR(f'Error updating exchange rates: {e}'))
