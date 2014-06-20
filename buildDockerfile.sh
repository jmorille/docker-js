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
      docker build -t $PROJECT_NAMESPACE/$v $v/. || exit 1
      echo ""
    done
}

function buildDockerRegistryImages {
    for v
    in  docker-registry
    do
      echo ""
      echo "### #################################################### ###"
      echo "### Building docker images : $v"
      echo "### #################################################### ###"
      docker build -t $PROJECT_NAMESPACE/$v $v/. || exit 1
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
      docker tag $PROJECT_NAMESPACE/$v $DOCKER_REGISTRY_URL/$v:$PROJECT_VERSION || exit 1
      docker push  $DOCKER_REGISTRY_URL/$v || exit 1
      echo ""
    done
}

function buildAndTagDockerImages {
  buildDockerRegistryImages || exit 1
  buildDockerImages || exit 1
  # tagDockerImages || exit 1
}


buildAndTagDockerImages < /dev/tty
