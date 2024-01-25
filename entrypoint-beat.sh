#!/bin/sh

celery -A run-celery beat --loglevel=info --logfile=beat.log --detach