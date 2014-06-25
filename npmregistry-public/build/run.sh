#!/bin/bash

USR=$1
PWD=$2

URL="http://$USR:$PWD@localhost:5984/registry"
URL_REPLICATOR="http://$USR:$PWD@localhost:5984/_replicate"

function createRepo {
    # test l'existence de la base
    BDD=$(curl -s -X GET $URL | grep  '\db_name":"registry"' > /dev/null && echo "true" || echo "false")
     echo "Testing Existing bower Database : $BDD"
    if [ "$BDD" == "false" ]
    then
       curl -s -X PUT $URL
       curl -s -X PUT $URL/error%3A%20forbidden2 -d '{ "_id": "error: forbidden", "forbidden":"must supply latest _rev to update existing package" }'
       cd /opt/npm-registry-couchapp
       npm start  --npm-registry-couchapp:couch=$URL
       npm run load  --npm-registry-couchapp:couch=$URL
       echo "yes" | npm run copy  --npm-registry-couchapp:couch=$URL
    else
       echo "Existing CouchDb DataBase"
    fi
}

function startReplication {
    curl -X POST $URL_REPLICATOR  -d \
       '{"source":"https://fullfatdb.npmjs.com/registry", "target":"registry", "create_target":true, "continuous":true,  "proxy":"http://172.30.3.11:3128"}' \
       -H "Content-Type: application/json"
}

function setup {
    sed -i'' 's/;admin = mysecretpassword/'$USR' = '$PWD'/' /usr/local/etc/couchdb/local.ini

    # echo ----------------------------------------------
    # cat /usr/local/etc/couchdb/local.ini | grep admin
    # echo ----------------------------------------------
    # cat /usr/local/etc/couchdb/local.ini | grep USR
    # echo ----------------------------------------------

    # Start CouchDb
    /usr/local/bin/couchdb start & sleep 5

    # Create Repo
    createRepo

    # Start Replication
    startReplication

   # Lock Starting
   wait
   # /bin/bash
}


setup < /dev/tty
