#!/bin/bash

#stop all containers
docker stop $(docker container ls -aq)

# Remove all containers, images, networks, and volumes
docker system prune -af --volumes
docker volume rm $(docker volume ls)
docker network rm $(docker network ls)
