#jmorille/chef-server
FROM jmorille/ubuntu

# Install Wget
# #######################
RUN apt-get update
RUN apt-get -y install wget

# Install Chef
# #######################
# http://www.getchef.com/chef/install/

RUN	wget --content-disposition "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef-server_11.1.1-1_amd64.deb"
#RUN	wget --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=12.04&m=x86_64&v=latest&prerelease=false&nightlies=false"
RUN	dpkg -i chef-server*


RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -sf /bin/true /sbin/initctl

#RUN	sysctl -w kernel.shmall=4194304 && sysctl -w kernel.shmmax=17179869184 && \
#	/opt/chef-server/embedded/bin/runsvdir-start & \
#	chef-server-ctl reconfigure && \
#	chef-server-ctl stop


ADD	run_chef_server /usr/local/bin/run_chef_server

# Expose
# #######################
CMD	["run_chef_server"]

EXPOSE	443

  
 
