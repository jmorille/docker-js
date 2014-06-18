#!/bin/bash

USR=$1
PWD=$2

URL="http://$USR:$PWD@localhost:5984/bower"

function createRepo {
   # test l'existence de la base
   BDD=$(curl -s -X GET $URL | grep bower > /dev/null && echo "true" || echo "false")
   if [ "$BDD" == "false" ]
   then
      node  /opt/bower-registry/bin/create-database $USR $PWD
#      node  /opt/bower-registry/bin/create-user -u $BOWER_ADMIN_USER -p $BOWER_ADMIN_PASSWORD
   fi
}

function setup {
    /usr/local/bin/couchdb start & sleep 5
    createRepo
    node  /opt/bower-registry/bin/bower-registry
}

setup < /dev/tty