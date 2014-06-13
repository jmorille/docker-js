docker-js
=========

 sudo usermod -a -G docker a000cqp

# Config global
/etc/default/docker


# Docker Image indexes
https://index.docker.io/

# Docker list process
docker ps

# Stop / remove all Docker containers
docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)


docker rmi $(docker images -q)