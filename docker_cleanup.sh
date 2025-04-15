#!/bin/bash
#echo "clean all except images - to prevent long downloads"


echo "alle container stoppen"
docker stop $(docker ps -aq)

#echo "alle images löschen"
#docker rm $(docker ps -aq)
#docker rmi $(docker images -q)
docker rmi $(docker images -q)

echo "system cleanen"
docker system prune

#docker network rm ts-services
echo "clean netzwerk"
docker network prune  --force
docker network rm ts-services

echo "volumes löschen"
docker volume rm $(docker volume ls -q --filter dangling=true)

echo "docker engine stoppen"
sudo systemctl stop docker.socket
sudo systemctl stop docker

#sudo systemctl status docker
#sudo systemctl stop snap.docker.dockerd

echo "docker engine starten"
sudo systemctl start docker
#sudo systemctl start snap.docker.dockerd


docker ps -a
