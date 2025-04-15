#!/bin/bash
docker volume rm $(docker volume ls -q --filter dangling=true)
#docker volume rm $(docker volume ls -q)
