#jmorille/nodejs

FROM jmorille/ubuntu

ENV NODE_HOME /opt/nodejs/node-v0.10.28-linux-x64
ENV PATH $PATH:$NODE_HOME/bin

ADD build build
RUN exec /build/install.sh

