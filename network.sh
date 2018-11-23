#!/bin/bash
# ./network.sh

# Create bridge network
docker network create --driver bridge --subnet 172.42.0.0/30 --gateway 172.42.0.1 skynet
