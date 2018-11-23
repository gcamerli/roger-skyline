#!/bin/bash
# ./run.sh

set -euo pipefail

# Colors
red='\033[0;31m'
green='\033[0;32m'
white='\033[0;m'

function build {
  echo ""
  echo -e "$green[Start]$white Docker build"
  echo ""
  docker build -t roger .
  echo -e "Build roger ...$green done$white"
  echo ""
  echo -e "$green[Status]$white Build ...$green OK$white"
}

function clean {
  echo ""
  echo -e "$green[Start]$white Docker network cleanup"
  echo ""
  docker network prune -f
  echo ""
  echo -e "Docker network cleanup ...$green done$white"
}

function network {
  echo ""
  echo -e "$green[Start]$white Docker network"
  echo ""
  bash network.sh
  echo ""
  echo -e "Docker network ...$green done$white"
}

function compose {
  echo ""
  echo -e "$green[Start]$white Docker compose"
  echo ""
  docker-compose up -d
  echo ""
  echo -e "Docker compose ...$green done$white"
}

function main () {
  build
  clean
  network
  compose
}

main
