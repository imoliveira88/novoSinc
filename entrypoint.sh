#!/bin/bash

gunicorn novoSinc.wsgi:application --bind 0.0.0.0:8000 --workers 3 --log-level debug

#python3 manage.py runserver