Install all packages with:
- pip install -r requirements.txt

Connect to the temp database:
- You will need to import the SQL dump file into your PostgreSQL database.
- First, you need PostgreSQL installed on their system.

- You need to create a new empty database where you want to import the dump.

- Then, you can use the psql command to import the dump into the newly created database. The command looks like this:
- - psql -U abdu -d uzrent -f db_dump.sql

then run this code on your terminal
- python manage.py runserver

and open the server which is going to be on http://127.0.0.1:8000
