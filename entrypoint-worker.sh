#!/bin/sh

celery -A run-celery worker --loglevel=info --logfile=worker.log --detach