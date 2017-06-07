#!/bin/bash

VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)

docker pull $IMAGE_NAME:$VERSION

DOCKER_VOLUME=$(docker volume ls | grep mariadb_data | awk {'print $2'})

if [ ! "$DOCKER_VOLUME" = "mariadb" ]
then
    docker volume create --name mariadb_data
fi
