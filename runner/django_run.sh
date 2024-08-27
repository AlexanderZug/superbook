#!/bin/sh

python3 src/manage.py makemigrations
python3 src/manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python3 src/manage.py shell
python3 src/manage.py runserver 0.0.0.0:8000
