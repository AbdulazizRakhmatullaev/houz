Install all packages with:
- pip install -r requirements.txt

Connect to the temp database:
- psql -U abdu -d uzrent -f db_dump.sql

then run this code on your terminal
- python manage.py runserver

and open the server which is going to be on http://127.0.0.1:8000
