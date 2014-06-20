#jmorille/git-server
FROM jmorille/ubuntu

# Config Git Repo
# #######################
ENV REPOSITORY_GIT /data/git-repo

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

# Install build
# #######################
ADD build build
RUN exec /build/install.sh


# Expose
# #######################
VOLUME ["/data/git-repo", "/var/log/apache2"]

EXPOSE 80 443

CMD  exec apache2 -D FOREGROUND

#CMD /etc/init.d/apache2 start && /bin/bash
# CMD (/usr/local/bin/run &) ; /usr/sbin/sshd -D