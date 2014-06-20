#jmorille/couchdb
FROM jmorille/nodejs


ADD build build
RUN exec /build/install.sh


# Build
#RUN cd /opt/couchdb && \
#  ./configure   --with-erlang=/usr/lib64/erlang/usr/include/ && \
#  make && \
#  make install && \
#  rm -rf /opt/couchdb

# Configure
#RUN  sed -i'' '/COUCHDB_USER=/d' /usr/local/etc/default/couchdb
#RUN  sed -i'' 's/bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /usr/local/etc/couchdb/default.ini



VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb"]

EXPOSE 5984

CMD ["/usr/local/bin/couchdb"]
