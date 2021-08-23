#!/bin/sh

set -e

ls -la /vol/
ls -la /vol/web

pip install -r requirements.txt
python manage.py makemigrations --no-input
python manage.py migrate --no-input
python manage.py collectstatic --no-input

gunicorn backend.wsgi:application --workers=3 --threads=3 --worker-class=gthread --bind 0.0.0.0:8000

