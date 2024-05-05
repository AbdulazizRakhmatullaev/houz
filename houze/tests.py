from django.test import TestCase

ams = [am for am in ('aasd, asd, asd, asd,                 ').split(",") if am.strip() != '']
print(ams)