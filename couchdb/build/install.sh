#!/bin/bash


function installCouchDbSources {
  # URL, contains specific version
  # ################
  COUCHDB_URL=http://apache.tradebit.com/pub/couchdb/source/1.5.1/apache-couchdb-1.5.1.tar.gz

  # couchdb deps
  # Dev essential dependencies
  apt-get install -y g++ make
  apt-get install -y erlang-dev erlang-manpages erlang-base-hipe erlang-eunit erlang-nox erlang-xmerl erlang-inets
  apt-get install -y libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool


  # Fetch source code
  mkdir -p /opt/couchdb
  curl -s -o /opt/couchdb.tar.gz ${COUCHDB_URL}
  tar -C /opt/couchdb --strip-components 1 -xzf /opt/couchdb.tar.gz
  rm /opt/couchdb.tar.gz

  # Build
  cd /opt/couchdb
  ./configure   --with-erlang=/usr/lib64/erlang/usr/include/
  make
  make install
  rm -rf /opt/couchdb

  # Configure
  sed -i'' '/COUCHDB_USER=/d' /usr/local/etc/default/couchdb
  sed -i'' 's/bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /usr/local/etc/couchdb/default.ini
}


function cleanBuildInstall {
   apt-get -y autoremove
   apt-get clean
   rm -rf /build
}

function setup {
  # Script Start
  # #######################
  apt-get update
  chmod +x /build/*.sh

  # Install
  # #######################
  installCouchDbSources || exit 1


  # Clean Images
  # #######################
  cleanBuildInstall || exit 1
}


setup
