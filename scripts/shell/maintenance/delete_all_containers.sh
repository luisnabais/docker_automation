#!/bin/bash

# Require script to be run with root privilages
if [ “$(id -u)” != “0” ]; then
    echo "Script must be run with root privilages!" 2>&1
    exit 1
fi

# Stop all containers
docker stop $(docker ps -q)

# Delete all containers
docker rm $(docker ps -a -q)
