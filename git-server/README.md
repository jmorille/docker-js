jmorille/git-server
=========

http://git-scm.com/book/fr/Git-sur-le-serveur-Installation-de-Git-sur-un-serveur


# Build Image  
sudo docker build -t jmorille/git-server .
 

# View Image
sudo docker run -i -t \
   -p 8585:80 \
   -v /tmp/git-server/gitweb:/var/www/gitweb \
   -v /tmp/git-server/log:/var/log/apache2 \
   jmorille/git-server /bin/bash



# Run Image
sudo docker run -i -t \
   -p 8585:80 \
   -v /tmp/git-server/gitweb:/var/www/gitweb \
   -v /tmp/git-server/log:/var/log/apache2 \
   jmorille/git-server 
