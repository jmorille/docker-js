
# Build Image
docker build -t jmorille/bower-private .
 

# View Image
docker run -i -t -p 3333:3333 \
   -v /couchdb/bower/data:/usr/local/var/lib/couchdb \
   -v /couchdb/bower/log:/usr/local/var/log/couchdb \
   jmorille/bower-private /bin/bash


# Init Image
docker run -i -t -p 3333:3333 \
 -v /couchdb/bower/data:/usr/local/var/lib/couchdb \
 -v /couchdb/bower/log:/usr/local/var/log/couchdb \
 jmorille/bower-private \
  /usr/local/bin/couchdb start -b &&  sleep 5 && \
  node  /opt/bower-registry/bin/create-database admin admin


 node  /opt/bower-registry/bin/create-user -u ccjava -p ccjava
 node  /opt/bower-registry/bin/bower-registry
 
# Check Image
http://127.0.0.1:3333/packages

# Run Image
docker run -i -t -p 3333:3333 \
 -v /couchdb/bower/data:/usr/local/var/lib/couchdb \
 -v /couchdb/bower/log:/usr/local/var/log/couchdb \
 jmorille/bower-private
 
 
 
# Push Image
docker tag jmorille/bower-private gf219896.groupe.generali.fr:5000/bower-private:0.0.1
docker push gf219896.groupe.generali.fr:5000/bower-private
 
docker pull gf219896.groupe.generali.fr:5000/bower-private


docker run -i -t -p 3334:3333 \
 -v /couchdb/bower/data:/usr/local/var/lib/couchdb \
 -v /couchdb/bower/log:/usr/local/var/log/couchdb \
 jmorille/bower-private /bin/bash
 
 
 