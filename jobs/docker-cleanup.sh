#!/bin/bash

if (! docker stats --no-stream ); then
  open /Applications/Docker.app
while (! docker stats --no-stream ); do
  echo "Waiting for Docker to launch..."
  sleep 1
done
fi

yes Y | docker rmi $(docker images -q -f dangling=true)
yes Y | docker volume rm $(docker volume ls -qf dangling=true)
yes Y | docker system prune -a