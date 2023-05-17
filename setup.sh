#!/bin/bash


# Install docker
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apt-transport-https ca-certificates software-properties-common

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

sudo exec $SHELL -l

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
sudo mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.3.4/docker-compose-linux-armv7 -o $DOCKER_CONFIG/cli-plugins/docker-compose

sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose