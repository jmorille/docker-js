#jmorille/couchdb
FROM jmorille/nodejs


# Dev essential dependencies
RUN apt-get install -y wget curl gcc gcc-c++ kernel-devel


# URL, contains specific version
ENV COUCHDB_URL http://apache.tradebit.com/pub/couchdb/source/1.5.1/apache-couchdb-1.5.1.tar.gz

# couchdb deps
RUN apt-get -y install autoconf autoconf-archive automake curl-devel erlang-asn1 erlang-erts erlang-eunit erlang-os_mon erlang-xmerl help2man js-devel libicu-devel libtool perl-Test-Harness


# Fetch source code
RUN mkdir -p /opt/couchdb && \
    curl -s -o /opt/couchdb.tar.gz ${COUCHDB_URL} && \
    tar -C /opt/couchdb --strip-components 1 -xzf /opt/couchdb.tar.gz && \
    rm /opt/couchdb.tar.gz

# Build
RUN cd /opt/couchdb && \
    ./configure   --with-erlang=/usr/lib64/erlang/usr/include/ && \
    make && \
    make install && \
    rm -rf /opt/couchdb

# Configure
RUN sed -i'' '/COUCHDB_USER=/d' /usr/local/etc/default/couchdb
RUN  sed -i'' 's/bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /usr/local/etc/couchdb/default.ini

#RUN cp /usr/local/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb && \
#    cp /usr/local/etc/init.d/couchdb /etc/init.d/couchdb && \
#    update-rc.d couchdb defaults && \
#    sed -i'' '/COUCHDB_USER=/d' /usr/local/etc/default/couchdb && \
#    sed -i'' 's/bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /usr/local/etc/couchdb/default.ini

# Reset DEBIAN_FRONTEND
# ENV  DEBIAN_FRONTEND newt
# ENV  DEBIAN_FRONTEND noninteractive

VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb"]

EXPOSE 5984

CMD ["/usr/local/bin/couchdb"]
