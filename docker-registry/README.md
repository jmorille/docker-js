jmorille/docker-registry
=========

https://github.com/dotcloud/docker-registry

# Bug 
"storage_path" configuration is not reflected.
https://github.com/dotcloud/docker-registry/issues/401


# View Image
docker run -i -t  -p 5000:5000 \
  -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml \
  -e SETTINGS_FLAVOR=local \
  -e STORAGE_PATH=/tmp/registry \
  -v /tmp/registry:/tmp \
  -v /home/a000cqp/socle/docker-js/docker-registry/:/registry-conf \
  registry
  

  # View Image
docker run -i -t  -p 5000:5000 \
    -v /home/a000cqp/socle/docker-js/docker-registry/:/registry-conf \
    -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml \
    registry
    
    
# Run Image
docker run -p 5000:5000 \
  -v  /tmp/registry:/tmp/registry  \
  -v /home/a000cqp/socle/docker-js/docker-registry/:/registry-conf \
  -e DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml \
  registry
 