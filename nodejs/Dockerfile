#jmorille/nodejs

FROM jmorille/ubuntu


RUN apt-get install -y wget

# Install Git
# #################

# Version Compile Git
# RUN yum install -y zlib-devel perl-CPAN gettext
# RUN cd /opt && wget http://git-core.googlecode.com/files/git-1.9.0.tar.gz && tar xvfz git-1.9.0.tar.gz
# RUN cd /opt/git-1.9.0 && ./configure && \
#    make && \
#    make prefix=/usr install

# Version Install Git
RUN apt-get  install -y  git

# Config Git
RUN git --version
RUN git config --global http.proxy $HTTP_PROXY
RUN git config --global https.proxy $HTTP_PROXY
RUN git config --global -l

# Install Node JS
# #################
ENV NODE_HOME /opt/nodejs/node-v0.10.28-linux-x64

# Version Compile
#ADD http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz  .
#RUN cd node-v0.10.26 && ./configure && make && make install

# Version Add File
# ADD node-v0.10.28-linux-x64.tar.gz /opt/nodejs
# ADD http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz /opt/nodejs

# Version Download
RUN mkdir -p $NODE_HOME
RUN curl -f -o /node-install.tar.gz http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
    tar -xzf /node-install.tar.gz -C  $NODE_HOME/.. && \
    rm node-install.tar.gz

# Config Node JS
ENV PATH $PATH:$NODE_HOME/bin
RUN echo $PATH

# Config Npm
# RUN npm config set registry "http://registry.npmjs.org/"

RUN npm config set proxy http://172.30.3.11:3128
RUN npm config set https-proxy http://172.30.3.11:3128
RUN npm config set strict-ssl false
RUN npm config list

RUN node --version
RUN npm --version
# #################
