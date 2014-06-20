#jmorille/docker-registry
FROM registry:0.7.2

ENV SETTINGS_FLAVOR local
ENV DOCKER_REGISTRY_CONFIG /registry-conf/config.yml
ENV STORAGE_PATH /tmp/registry


ADD config.yml /registry-conf/config.yml

VOLUME ["/tmp/registry" ]

# EXPOSE 5000

