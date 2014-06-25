#jmorille/npmregistry-public
FROM generali_ccj/couchdb


ADD build build
RUN exec /build/install.sh



EXPOSE 5984

# CMD ["/usr/local/bin/couchdb"]
CMD  exec /run.sh admin admin