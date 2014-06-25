#!/bin/bash

USR=$1
PWD=$2


BOWER_ADMIN_USER=boweradmin
BOWER_ADMIN_PASSWORD=boweradmin

#URL="http://$USR:$PWD@localhost:5984/bower"
URL="http://localhost:5984/bower"


function createRepo {
   # test l'existence de la base
   BDD=$(curl -s -X GET $URL | grep  '\db_name":"bower"' > /dev/null && echo "true" || echo "false")
   # echo "Testing Existing bower Database : $BDD"
   if [ "$BDD" == "false" ]
   then
      echo "Create bower Database"
      node  /opt/bower-registry/bin/create-database $USR $PWD
      node  /opt/bower-registry/bin/create-user -u $BOWER_ADMIN_USER -p $BOWER_ADMIN_PASSWORD
   else
      echo "Existing bower Database"
   fi
}

function setup {
    /usr/local/bin/couchdb start & sleep 5
    createRepo
    node  /opt/bower-registry/bin/bower-registry
}

setup < /dev/tty