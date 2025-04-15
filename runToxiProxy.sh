#!/bin/bash
docker run --name=toxiproxy --rm --expose 6666 -p 6666:6666 -it shopify/toxiproxy

#https://blog.jakubholy.net/2017/05/09/simulating-network-timeouts-with-toxiproxy/
#
#  docker exec -it toxiproxy /bin/sh
#  / # cd /go/bin/
#  /go/bin # ./toxiproxy-cli create upstream -l 0.0.0.0:6666 -u google.com:443
