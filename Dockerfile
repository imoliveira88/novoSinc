# Use a minimal Ubuntu base image
FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /app

# Update package lists and install necessary packages
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python python-pip

RUN libpq-dev libaio1 redis redis-server nano plocate zip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Gunicorn and psycopg2-binary
RUN pip3 install gunicorn psycopg2-binary

# Set up Oracle client
COPY instantclient-basic-linux.x64-19.22.0.0.0dbru.zip /tmp/
RUN unzip /tmp/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip -d /usr/local/ && \
    rm /tmp/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip

ENV ORACLE_HOME=/usr/local/instantclient_19_22
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
ENV PATH=$PATH:$ORACLE_HOME

# Copy the application code
COPY . /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy and configure Redis
COPY redis.conf /etc/redis.conf

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=novoSinc.settings

# Make the entrypoint.sh script executable
RUN chmod +x /app/entrypoint.sh

# Expose Gunicorn port
EXPOSE 8000

# Start the application using entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
