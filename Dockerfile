FROM    debian:latest
# Install MongoDB
RUN apt-get update
RUN apt-get install -y bind9 bind9utils
# Create the MongoDB data directory
RUN mkdir -p /etc/bind
ADD etc/bind/db.docker.zone /etc/bind/
ADD etc/bind/named.conf.local /etc/bind/
ADD etc/bind/named.conf.options /etc/bind/

