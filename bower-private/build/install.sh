#!/bin/bash


function installBower {
   npm config list
   git config --global -l

   # Install GCC
   # #######################
   # Necessaire pour recompiler bcrypt
   apt-get install -y gcc gcc-c++
   apt-get install -y python

   # Install Bower Registry
   # #######################

   git clone https://github.com/bower/registry.git  -b node_rewrite /opt/bower-registry
   cd /opt/bower-registry
   npm install

   # Config Bower Registry
   # #######################
   # sed -i'' "s/'database': 'bower'/'database': 'bower-private'/"  /opt/bower-registry/lib/helpers/config.js

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
  mv /build/run.sh .

  # Install
  # #######################
  installBower || exit 1


  # Clean Images
  # #######################
  cleanBuildInstall || exit 1
}


setup
