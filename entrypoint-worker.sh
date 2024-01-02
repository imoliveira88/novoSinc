#!/bin/sh

python3 run-celery.py -A novoSinc worker --loglevel=debug --concurrency 1 -E
python3 run-celery.py -A novoSinc beat --loglevel=info --logfile=beat.log