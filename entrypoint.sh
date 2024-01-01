#!/bin/bash

python3 run-celery.py -A novoSinc worker --loglevel=debug --logfile=worker.log

python3 run-celery.py -A novoSinc beat --loglevel=info 
 --logfile=beat.log

gunicorn novoSinc.wsgi:application --bind 0.0.0.0:8000 --workers 3 --log-level debug

#python3 manage.py runserver