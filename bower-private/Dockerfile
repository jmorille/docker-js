#jmorille/bower-private

FROM jmorille/couchdb

ADD build build
RUN exec /build/install.sh

# #######################

VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb"]


EXPOSE 3333


CMD  exec /run.sh admin admin




