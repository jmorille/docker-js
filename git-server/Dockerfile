#jmorille/git-server
FROM ubuntu:14.04
 
# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Fix locales
# RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Config proxy env
# ENV http_proxy http://172.30.3.11:3128
# ENV https_proxy http://172.30.3.11:3128
# ENV no_proxy *.groupe.generali.fr

# ENV HTTP_PROXY http://172.30.3.11:3128
# ENV HTTPS_PROXY http://172.30.3.11:3128
# ENV NO_PROXY *.groupe.generali.fr

# Enable universe
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
 
# Update Ubuntu
# #######################
RUN apt-get update 
RUN apt-get -y upgrade  
RUN apt-get clean 

# Install Git
# #######################
RUN apt-get -y install git

# Install GitWeb
# #######################
RUN apt-get -y install gitweb
RUN sed -i'' 's/$projectroot = *;/$projectroot = "/var/www/git";/' /etc/gitweb.conf 

# Install Apache2 HTTPD
# #######################
RUN apt-get -y install apache2 


# Config Apache 2
# #######################

# let's copy a few of the settings from /etc/init.d/apache2
ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_LOCK_DIR /var/lock/apache2
 
RUN mkdir -p $APACHE_LOCK_DIR/..
RUN a2enmod rewrite 

RUN rm /etc/apache2/sites-enabled/*
ADD etc/001-gitserver.conf /etc/apache2/sites-available/001-gitserver.conf
RUN a2ensite 001-gitserver
 
# setup repo git
ADD git-repo /var/www/git
RUN chmod +x /var/www/git/*.sh

# Expose
# #######################
VOLUME ["/var/www/git", "/var/log/apache2"]

EXPOSE 80 443

CMD ["apache2", "-D", "FOREGROUND"]
