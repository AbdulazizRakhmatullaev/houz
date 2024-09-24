import requests
from decimal import Decimal
from bs4 import BeautifulSoup

dt = {}

url = "https://cbu.uz/ru/"
html_txt = requests.get(url).text
soup = BeautifulSoup(html_txt, "html.parser")
tags = soup.find_all("div", class_="exchange__item_value")

for name, rate in tags:
    dt[name.text] = Decimal(rate.text[3:])

print(dt)