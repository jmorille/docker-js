#jmorille/git-server
FROM jmorille/ubuntu

# Install Git
# #######################
RUN apt-get -y install git

ENV REPOSITORY_GIT /data/git-repo
# Install GitWeb
# #######################
RUN apt-get -y install gitweb
RUN sed -i 's/$projectroot = "\/var\/lib\/git";/$projectroot = "\/data\/git-repo";/' /etc/gitweb.conf
RUN sed -i 's/^#\$/\$/' /etc/gitweb.conf


# Install Apache2 HTTPD
# #######################
RUN apt-get -y install apache2 apache2-utils


# Config Apache 2
# #######################
# let's copy a few of the settings from /etc/init.d/apache2
ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache.pid

RUN mkdir -p $APACHE_LOCK_DIR
RUN chown www-data:www-data $APACHE_LOCK_DIR
RUN a2enmod rewrite 
RUN a2enmod cgi
RUN a2enmod alias
RUN a2enmod env

# Git Host Apache
# #######################
RUN rm /etc/apache2/sites-enabled/*
ADD etc/001-gitserver.conf /etc/apache2/sites-available/001-gitserver.conf
RUN a2ensite 001-gitserver

# Add Variable Apache
# #######################
RUN echo "export REPOSITORY_GIT=$REPOSITORY_GIT" >> $APACHE_ENVVARS
RUN echo "export GITWEB_PROJECTROOT=$REPOSITORY_GIT" >> $APACHE_ENVVARS

# Script Start
# #######################
ADD etc/run.sh /run.sh
RUN chmod +x /run.sh

ADD git-repo/create-git-repo.sh /opt/create-git-repo.sh
RUN chmod +x /opt/create-git-repo.sh

RUN mkdir -p $REPOSITORY_GIT/..
RUN cp /opt/create-git-repo.sh $REPOSITORY_GIT/..


# TODO ENTRYPOINT ? chown -R www-data:www-data /var/www/git

# Apache Password
# #######################

RUN htpasswd -c -b -m /var/www/git-passwords jon jon
RUN chown www-data:www-data /var/www/git-passwords

# Expose
# #######################
VOLUME ["/data/git-repo", "/var/log/apache2"]

EXPOSE 80 443

CMD ["apache2", "-D", "FOREGROUND"]

#CMD /etc/init.d/apache2 start && /bin/bash
# CMD (/usr/local/bin/run &) ; /usr/sbin/sshd -D