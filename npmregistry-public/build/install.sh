#!/bin/bash


function installNpmRegistry {
   # Config Npm proxy source code
   # ################
    cd /opt
    git clone https://github.com/npm/npm-registry-couchapp.git
    cd npm-registry-couchapp
    npm install

    # Config CouchDB
    # ################
    sed -i'' 's/\[couch_httpd_auth\]/[couch_httpd_auth]\n \
public_fields = appdotnet, avatar, avatarMedium, avatarLarge, date, email, fields, freenode, fullname, github, homepage, name, roles, twitter, type, _id, _rev \n \
users_db_public = true/' \
 /usr/local/etc/couchdb/local.ini

    sed -i'' 's/\[httpd\]/[httpd]\n \
secure_rewrites = false/' \
 /usr/local/etc/couchdb/local.ini

    sed -i'' 's/\[couchdb\]/[couchdb]\n \
delayed_commits = false/' \
 /usr/local/etc/couchdb/local.ini
    #   sed -i'' 's/file_compression = snappy/file_compression = none/' /usr/local/etc/couchdb/default.ini


    #   sed -i'' 's/;admin = mysecretpassword/admin = admin/' \
    # /usr/local/etc/couchdb/local.ini
}


function installRunScript {
   mv /build/run.sh /run.sh
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

  # Install Git
  # #######################
  installNpmRegistry
  installRunScript

  # Clean Images
  # #######################
  cleanBuildInstall
}


setup
