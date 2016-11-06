#
# Haproxy Dockerfile
#
# https://github.com/dockerfile/haproxy
#

# Pull base image.
FROM haproxy:1.5

RUN apt-get update && apt-get install -y rsyslog vim curl --no-install-recommends

# Add files.
ADD haproxy.cfg.in /usr/local/etc/haproxy/haproxy.cfg.in
ADD start.bash /haproxy-start

# Define working directory.
WORKDIR /usr/local/etc/haproxy

# Allow to specify comma-separated list of COUCHDB_SERVERS from ENV
ENV COUCHDB_SERVERS="localhost:5984"

# Credentials
ENV COUCHDB_USERNAME=""
ENV COUCHDB_PASSWORD=""

# For proxy to work, it's sometime necessary to set the hostname right
ENV COUCHDB_HOSTNAME=""

# Define default command.
CMD ["bash", "/haproxy-start"]

# Expose ports.
EXPOSE 5984
