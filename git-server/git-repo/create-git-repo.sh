#!/bin/bash

GIT_REPO_DIR=/war/www/git

PROJECT_NAME=$1
PROJECT_DIR=$GIT_REPO_DIR/$PROJECT_NAME.git


function createRepo {
  mkdir -p $PROJECT_DIR
  cd $PROJECT_DIR
  git --bare init
  git update-server-info
  mv hooks/post-update.sample hooks/post-update
  chmod a+x hooks/post-update
  chown -R www-data:www-data $GIT_REPO_DIR
}

function setup {
  if [ -d $PROJECT_DIR ]; then
     echo "Directory already exist : $PROJECT_DIR"
  else
    if [ -z $PROJECT_NAME ]; then
       echo "No Project name in parameter"
    else
       createRepo
    fi
  fi
}


setup < /dev/tty
