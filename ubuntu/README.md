jmorille/ubuntu
=========
 
# Build Image  
docker build -t jmorille/ubuntu .
 

# View Image
docker run -i -t \
 -v /etc/localtime:/etc/localtime:ro \
 -v /etc/timezone:/etc/timezone:ro \
 jmorille/ubuntu /bin/bash
 

