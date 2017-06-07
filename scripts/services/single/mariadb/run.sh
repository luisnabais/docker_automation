#!/bin/bash

VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)
ROOT_PWD=$(grep "^ROOT_PWD=" CONFIG | cut -d'=' -f2)


docker run -ti -d \
--name $CONTAINER_NAME \
-e MYSQL_ROOT_PASSWORD=$ROOT_PWD \
--restart=always \
-v ${CONTAINER_NAME}_data:/var/lib/mysql \
-p 3306:3306 \
-d $IMAGE_NAME:$VERSION
