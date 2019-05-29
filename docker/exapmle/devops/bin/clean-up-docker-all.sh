#!/bin/bash
# Remove all containers.
docker rm -f $(docker ps -a)

# Remove all images.
docker rmi -f $(docker images -aq)

# Remove all volumes.
docker volume prune -f

# Remove all networks.
docker network prune -f