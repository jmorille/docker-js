# Build Image  
docker build -t jmorille/bower-public .
 

# View Image
docker run -i -t  jmorille/bower-public /bin/bash


# Run Image
docker run -i -t -p 1234:80  jmorille/bower-public




 
# Push Image
docker tag jmorille/bower-public 127.0.0.1:5000/bower-public:0.0.1
docker push 127.0.0.1:5000/bower-public
 
docker pull 127.0.0.1:5000/bower-public