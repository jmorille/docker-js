jmorille/docker-registry
=========

https://github.com/dotcloud/docker-registry

# Bug 
"storage_path" configuration is not reflected.
https://github.com/dotcloud/docker-registry/issues/401


# REST API
Monitoring : http://127.0.0.1:5000/v1/_ping
List images : http://127.0.0.1:5000/v1/search

Pour voir une images : http://127.0.0.1:5000/v1/repositories/library/git-server/tags


# Build Image
docker build -t generali_ccj/docker-registry .

# Run Image
docker run -d -p 5000:5000 \
  -v  /tmp/registry:/tmp/registry  \
  generali_ccj/docker-registry
    
    
    
# Run Direct Origin Image
docker run -p 5000:5000 \
  -v  /tmp/registry:/tmp/registry  \
  -v /home/a000cqp/socle/docker-js/docker-registry/:/registry-conf \
  -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml \
  registry
 