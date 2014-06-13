jmorille/git-server
=========

http://git-scm.com/book/fr/Git-sur-le-serveur-Installation-de-Git-sur-un-serveur


# Build Image  
docker build -t jmorille/git-server .
 

# View Image
docker run -i -t \
 -p 8585:80 \
 -v /tmp/git-server/repo:/data/git-repo \
 -v /tmp/git-server/log:/var/log/apache2 \
 jmorille/git-server /bin/bash

# First commit
git init
touch README
git add .
git commit -m 'first commit'
git remote add origin http://127.0.0.1:8585/git/repo.git
git push origin master


# Run Image
docker run -i -t \
 -p 8585:80 \
 -v /tmp/git-server/repo:/data/git-repo \
 -v /tmp/git-server/log:/var/log/apache2 \
 -v /etc/localtime:/etc/localtime:ro \
 -v /etc/timezone:/etc/timezone:ro \
 jmorille/git-server
 


# Push Image
docker tag jmorille/git-server 127.0.0.1:5000/git-server:0.0.1
docker push 127.0.0.1:5000/git-server


docker pull 127.0.0.1:5000/git-server