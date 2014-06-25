#!/bin/bash


function installBower {
  apt-get install -y apache2
  # Create mandatory Folder
  mkdir -p $APACHE_LOCK_DIR
  chown www-data:www-data $APACHE_LOCK_DIR
  # Remove All Site
  rm /etc/apache2/sites-enabled/*
  # Enable Module
  a2enmod proxy
  a2enmod proxy_http
  # Config Apache 2
  # #######################
  mv /build/001-bower.conf /etc/apache2/sites-available/001-bower.conf
  a2ensite 001-bower
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
  #mv /build/run.sh .

  # Install
  # #######################
  installBower || exit 1


  # Clean Images
  # #######################
  cleanBuildInstall || exit 1
}


setup
