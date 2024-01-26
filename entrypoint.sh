#!/bin/sh

until python3 manage.py makemigrations
do
    echo "Aplicando migrações..."
    sleep 2
done

until python3 manage.py migrate
do
    echo "Esperando banco de dados estar pronto..."
    sleep 2
done

# python3 manage.py collectstatic --noinput

# python manage.py createsuperuser --noinput
service redis-server restart

# Start Celery Worker
celery -A run-celery worker --loglevel=info --logfile=worker.log --detach

# Start Celery Beat
celery -A run-celery beat --loglevel=info --logfile=beat.log --detach

exec gunicorn novoSinc.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4 --log-level debug

#python3 manage.py runserver