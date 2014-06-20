#jmorille/ubuntu
FROM ubuntu:14.04

# Base Image recommandation : https://github.com/phusion/baseimage-docker
# ##############################################
# Set correct environment variables.
ENV HOME /root


# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Fix locales
# RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Config proxy env
#ENV http_proxy http://172.30.3.11:3128
#ENV https_proxy $http_proxy
#ENV no_proxy *.groupe.generali.fr

#ENV HTTP_PROXY $http_proxy
#ENV HTTPS_PROXY $http_proxy
#ENV NO_PROXY $no_proxy

# Enable universe
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list


# Container cannot connect to Upstart
# https://github.com/dotcloud/docker/issues/1024
# ##############################################
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

# Update Ubuntu
# ##############################################
# RUN (apt-get update ; apt-get -y upgrade ; apt-get -y autoremove; apt-get clean ;)

# EXPOSE 22

CMD /bin/bash
