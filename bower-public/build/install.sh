#!/bin/bash


function installBower {
  apt-get install -y apache2

  # Config Apache 2
  # #######################
  mv 001-bower.conf /etc/httpd/conf.d/
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
  #installBower || exit 1


  # Clean Images
  # #######################
  # cleanBuildInstall || exit 1
}


setup
