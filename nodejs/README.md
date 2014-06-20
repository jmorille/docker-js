# Build Image
docker build -t jmorille/nodejs .

 # Connect Image
docker run -i -t jmorille/nodejs /bin/bash