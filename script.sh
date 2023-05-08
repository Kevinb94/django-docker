#!/bin/sh
FILE=/app/django_app/
if [ -d "$FILE" ]; then
    cd /app/django_app
    python manage.py collectstatic --no-input 
    gunicorn django_app.wsgi:application --bind 0.0.0.0:8000
else
    django-admin startproject django_app \
    && cd /app/django_app \
    && python manage.py migrate \
    && python manage.py collectstatic --no-input \
    && python manage.py createsuperuser --no-input \
    && gunicorn django_app.wsgi:application --bind 0.0.0.0:8000
fi
