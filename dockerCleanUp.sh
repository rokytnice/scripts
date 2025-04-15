#!/bin/bash
docker stop $(docker ps -q) 
echo "cleanup docker images"
docker rm -vf $(docker ps -a -q)
docker image prune -a
