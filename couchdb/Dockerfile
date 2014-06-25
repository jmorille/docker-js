#jmorille/couchdb
FROM jmorille/nodejs


# Build
ADD build build
RUN exec /build/install.sh




VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb"]

EXPOSE 5984

#CMD ["/usr/local/bin/couchdb"]
