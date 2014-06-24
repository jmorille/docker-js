#jmorille/gitlab

FROM jmorille/ubuntu


# Packages / Dependencies
# #######################
RUN apt-get update -y  
RUN apt-get install -y vim
RUN update-alternatives --set editor /usr/bin/vim.basic

# Install the required packages (needed to compile Ruby and native extensions to Ruby gems):
RUN apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils


# Install Git
RUN apt-get install -y git-core
 

 
# Ruby
# #######################
 

# Database
# #######################
RUN  apt-get install -y postgresql-9.1 postgresql-client libpq-dev

# Login to PostgreSQL
#RUN  postgres psql -d template1


# VOLUME [ "/var/log/httpd"]

# Expose ports.
EXPOSE 80 443


# Define default command.
CMD exec httpd -cErrorLog /dev/stderr -DFOREGROUND
