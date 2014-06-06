jmorille/docker-registry
=========

docker  run -p 5000 samalba/docker-registry

https://index.docker.io/u/samalba/docker-registry/



# Build Image  
sudo docker build -t jmorille/git-server .
 

# View Image
docker run -i -t \
 -p 8585:80 \
 -v /tmp/git-server/repo:/var/www/git \
 -v /tmp/git-server/log:/var/log/apache2 \
 jmorille/docker-registry /bin/bash

 # First commit
git init
touch README
git add .
git commit -m 'first commit'
git remote add origin http://127.0.0.1:8585/repo.git
git push origin master

--> 
error: Cannot access URL http://192.168.59.103:8585/repo.git/, return code 22
fatal: git-http-push failed


# Run Image
docker run -i -t \
 -p 8585:80 \
 -v /tmp/git-server/repo:/var/www/git \
 -v /tmp/git-server/log:/var/log/apache2 \
 -v /etc/localtime:/etc/localtime:ro \
 -v /etc/timezone:/etc/timezone:ro \
 jmorille/docker-registry
 

