# Use an official Ubuntu base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Update and install necessary packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y libpq-dev libaio1 && \
    apt-get install -y redis redis-server nano plocate zip

# Install Gunicorn
RUN pip3 install gunicorn

# Install dependencies
RUN pip3 install psycopg2-binary

# Set up Oracle client
COPY instantclient-basic-linux.x64-19.22.0.0.0dbru.zip /tmp/
RUN unzip /tmp/instantclient-basic-linux.x64-19.22.0.0.0dbru.zip -d /usr/local/

ENV ORACLE_HOME=/usr/local/instantclient_19_22
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME
ENV PATH=$PATH:$ORACLE_HOME

# Copy the application code
COPY . /app/

RUN pip3 install --no-cache-dir -r requirements.txt

RUN rm /etc/redis/redis.conf
RUN cp /app/redis.conf /etc/redis/redis.conf

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=novoSinc.settings

# Make the entrypoint.sh script executable
RUN chmod +x /app/entrypoint.sh

#RUN python3 manage.py collectstatic --noinput

# Expose Gunicorn port
EXPOSE 8000

# Start the application using entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]