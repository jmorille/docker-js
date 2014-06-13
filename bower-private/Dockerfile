#jmorille/bower-private

FROM jmorille/couchdb


RUN npm config list
RUN git config --global -l

# Install GCC
# #######################
# Necessaire pour recompiler bcrypt
RUN apt-get install -y gcc gcc-c++

# Install Bower Registry
# #######################

RUN git clone https://github.com/bower/registry.git  -b node_rewrite /opt/bower-registry
RUN cd /opt/bower-registry && \
    npm install

# Config Bower Registry
# #######################
# RUN  sed -i'' "s/'database': 'bower'/'database': 'bower-generali'/"  /opt/bower-registry/lib/helpers/config.js

# #######################

VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb"]


EXPOSE 3333

CMD  /usr/local/bin/couchdb start -b && \
     sleep 5 && \
     node  /opt/bower-registry/bin/bower-registry



