#!/bin/bash

DOCKER_REGISTRY_URL=127.0.0.1:5000
PROJECT_NAMESPACE=jmorille
PROJECT_VERSION=0.0.1

function buildDockerImages {
    for v
    in  ubuntu ubuntu-ssh git-server nodejs couchdb bower-private bower-public npmregistry-public
    do
      echo ""
      echo "### ####################################"
      echo "### Building docker images : $v"
      echo "### ####################################"
      docker build -t $PROJECT_NAMESPACE/$v $v/.
      echo ""
    done
}

function buildDockerRegistryImages {
    for v
    in  dockerRegistry
    do
      echo ""
      echo "### #################################################### ###"
      echo "### Building docker images : $v"
      echo "### #################################################### ###"
      docker build -t $PROJECT_NAMESPACE/$v $v/.
      echo ""
    done
}

function tagDockerImages {
    for v
    in  git-server bower-private bower-public npmregistry-public
    do
      echo ""
      echo "### #################################################### ###"
      echo "### Tag docker images : $v to Version $PROJECT_VERSION"
      echo "### #################################################### ###"
      docker tag $PROJECT_NAMESPACE/$v $DOCKER_REGISTRY_URL/$v:$PROJECT_VERSION
      docker push  $DOCKER_REGISTRY_URL/$v
      echo ""
    done
}

function buildAndTagDockerImages {
  buildDockerRegistryImages
  buildDockerImages
  # tagDockerImages
}


buildAndTagDockerImages < /dev/tty