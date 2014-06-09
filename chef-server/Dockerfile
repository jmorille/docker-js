#jmorille/chef-server
FROM jmorille/ubuntu

# Install Wget
# #######################
RUN apt-get update
RUN apt-get -y install wget

# Install Chef
# #######################
RUN	wget --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=12.04&m=x86_64&v=latest&prerelease=false&nightlies=false"
RUN	dpkg -i chef-server*.deb

RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -sf /bin/true /sbin/initctl

RUN	sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184 && \
    /opt/chef-server/embedded/bin/runsvdir-start & \
    chef-server-ctl reconfigure && \
    chef-server-ctl stop

ADD	. /usr/local/bin/

# Expose
# #######################
CMD	["run.sh"]

EXPOSE	443

  
 
