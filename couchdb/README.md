# Build Image  
sudo docker build -t jmorille/couchdb .
 

# View Image
sudo docker run -i -t   jmorille/couchdb /bin/bash


# Run Image
sudo docker run -i -t -p 5984:5984 \
 -v /tmp/couchdb/data:/usr/local/var/lib/couchdb \
 -v /tmp/couchdb/log:/usr/local/var/log/couchdb \
 jmorille/couchdb


