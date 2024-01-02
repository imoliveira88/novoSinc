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

python3 manage.py collectstatic --noinput

# python manage.py createsuperuser --noinput

gunicorn novoSinc.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4 --log-level debug

python3 run-celery.py -A novoSinc worker --loglevel=debug --concurrency 1 -E
python3 run-celery.py -A novoSinc beat --loglevel=info --logfile=beat.log

#python3 manage.py runserver