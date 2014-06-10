jmorille/chef-server
======== 



# Build Image  
docker build -t jmorille/chef-server .
 

# View Image
docker run -i -t \
 -p 8443:443 \
 jmorille/chef-server /bin/bash
 
 

