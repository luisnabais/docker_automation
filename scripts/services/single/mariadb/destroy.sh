#!/bin/bash

CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
