#!/usr/bin/env bash

# Require script to be run with root privilages
if [ “$(id -u)” != “0” ]; then
    echo "Script must be run with root privilages!" 2>&1
    exit 1
fi

# add key
curl -sSL https://get.docker.com/gpg | sudo apt-key add -

#install
curl -sSL https://get.docker.com/ | sh

# run
docker run hello-world
