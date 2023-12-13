# Use an official Ubuntu base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Update and install necessary packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y libpq-dev && \
    apt-get install -y redis-server

# Install Gunicorn
RUN pip3 install gunicorn

# Install dependencies
RUN pip3 install psycopg2-binary

# Copy the application code
COPY . /app/

RUN pip3 install --no-cache-dir -r requirements.txt

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=queryHelper.settings

# Make the entrypoint.sh script executable
RUN chmod +x /app/entrypoint.sh

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
RUN python3 manage.py collectstatic --noinput

RUN find . -name "entrypoint.sh"

# Expose Gunicorn port
EXPOSE 8000

# Start the application using entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]