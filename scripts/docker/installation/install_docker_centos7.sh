#!/usr/bin/env bash

# Require script to be run with root privilages
if [ “$(id -u)” != “0” ]; then
    echo "Script must be run with root privilages!" 2>&1
    exit 1
fi

# update system
yum update

# add repository
cat >/etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# install package
yum install docker-engine

# start
systemctl start docker

# enable on boot
systemctl enable docker
chkconfig docker on

# test docker
docker run hello-world
