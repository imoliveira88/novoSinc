# Use an official Ubuntu base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Update and install necessary packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y libpq-dev && \
    apt-get install -y redis nano plocate

# Install Gunicorn
RUN pip3 install gunicorn

# Install dependencies
RUN pip3 install psycopg2-binary
RUN pip3 install django4-background-tasks
RUN pip3 install django-jinja
RUN pip3 install celery
RUN pip3 install redis
RUN pip3 install mysql-connector

# Copy the application code
COPY . /app/

RUN pip3 install --no-cache-dir -r requirements.txt

RUN rm /etc/redis/redis.conf
COPY /app/redis.conf /etc/redis/redis.conf
RUN service redis-server start

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=novoSinc.settings

# Make the entrypoint.sh script executable
RUN chmod +x /app/entrypoint.sh
#RUN chmod +x /app/entrypoint-worker.sh

#RUN python3 manage.py collectstatic --noinput

# Expose Gunicorn port
EXPOSE 8000

# Start the application using entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
#ENTRYPOINT ["/app/entrypoint-worker.sh"]