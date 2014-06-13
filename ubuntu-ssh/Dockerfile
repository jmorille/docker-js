#jmorille/ubuntu-ssh
FROM jmorille/ubuntu


# install SSH server so we can connect multiple times to the container
# ####################### 
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd 
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# configure the "root" and "admin" users
# ####################### 

RUN echo 'root:admin' |chpasswd
RUN useradd -m -d /home/admin admin --shell /bin/bash && adduser admin sudo
RUN echo 'admin:admin' |chpasswd
 

EXPOSE 8080
EXPOSE 22
  


CMD /usr/sbin/sshd -D

#CMD (/usr/local/bin/run &) ; /usr/sbin/sshd -D
