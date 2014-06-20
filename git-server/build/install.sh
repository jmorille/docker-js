#!/bin/bash



function installGit {
  apt-get -y install git

  # Create Apache Env
  echo "export REPOSITORY_GIT=$REPOSITORY_GIT" >> $APACHE_ENVVARS

  # Create Repo Script
  mkdir -p $REPOSITORY_GIT/..
  cp /build/create-git-repo.sh $REPOSITORY_GIT/..
  mv  /build/create-git-repo.sh /opt/create-git-repo.sh
}

function installGitWeb {
  apt-get -y install gitweb
  sed -i 's/$projectroot = "\/var\/lib\/git";/$projectroot = "\/data\/git-repo";/' /etc/gitweb.conf
  sed -i 's/^#\$/\$/' /etc/gitweb.conf
  echo "export GITWEB_PROJECTROOT=$REPOSITORY_GIT" >> $APACHE_ENVVARS
}

function installApache2 {
   apt-get -y install apache2
   mkdir -p $APACHE_LOCK_DIR
   chown www-data:www-data $APACHE_LOCK_DIR
   a2enmod rewrite
   a2enmod cgi
   a2enmod alias
   a2enmod env
   # Remove All Site
   rm /etc/apache2/sites-enabled/*
}

function installApache2TlsCertificat {
  a2enmod ssl
  # make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/ssl/private/localhost.pem
}

function installApache2PasswordFile {
   apt-get -y install  apache2-utils
   # Enable Site
   mv /build/001-gitserver.conf /etc/apache2/sites-available/001-gitserver.conf
   a2ensite 001-gitserver
   # Apache Password
   # #######################
   htpasswd -c -b -m /var/www/git-passwords jon jon
   chown www-data:www-data /var/www/git-passwords
}

function installApache2Ldpa {
   a2enmod authnz_ldap
   a2enmod ldap
   # Enable Site
   mv /build/001-gitserver-ldap.conf /etc/apache2/sites-available/001-gitserver-ldap.conf
   a2ensite 001-gitserver-ldap
}

function cleanBuildInstall {
   apt-get -y autoremove
   apt-get clean
   rm -rf /build
}


function setup {
  # Script Start
  chmod +x /build/*.sh

  # Install Apache2 HTTPD
  # #######################
  installApache2
  #installApache2TlsCertificat
  installApache2PasswordFile
  #installApache2Ldpa

  # Install Git
  # #######################
  installGit

  # Install GitWeb
  # #######################
  installGitWeb

   # Run Scripts
   # #######################
   mv /build/run.sh /run.sh

   # Clean Images
   # #######################
   cleanBuildInstall
}


setup
