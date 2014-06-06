jmorille/ubuntu-ssh
=========
 
# Build Image  
docker build -t jmorille/ubuntu-ssh .
 

# View Image
docker run -i -t \
 -p 4022:22
 jmorille/ubuntu-shh
 

# Test Image
ssh admin@127.0.0.1 -p 4022


