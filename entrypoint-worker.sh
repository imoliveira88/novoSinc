#!/bin/sh

celery -A run-celery worker --loglevel=info --logfile=worker.log
celery -A run-celery.py beat --loglevel=info --logfile=beat.log

#python3 run-celery.py -A novoSinc worker --loglevel=debug --concurrency 1 -E
#python3 run-celery.py -A novoSinc beat --loglevel=info --logfile=beat.log