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

exec gunicorn novoSinc.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4 --log-level debug

# Start Celery Worker
./entrypoint-worker.sh

# Start Celery Beat
./entrypoint-beat.sh

#python3 manage.py runserver