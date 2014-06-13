#jmorille/bower-public

FROM jmorille/ubuntu


# Install Apache 2
# #######################
RUN apt-get install -y apache2

# Config Apache 2
# #######################

ADD etc/001-bower.conf /etc/httpd/conf.d/


# VOLUME [ "/var/log/httpd"]

# Expose ports.
EXPOSE 80
EXPOSE 443


# Define default command.
CMD ["httpd", "-cErrorLog /dev/stderr", "-DFOREGROUND"]