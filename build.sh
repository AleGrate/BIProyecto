#!/usr/bin/env bash

TAG=DEV_1.0

REGISTRY=nexus.cgtscorp.com:8082

docker stop hacc-db
docker rm hacc-db
docker rmi -f $(docker images | grep hacc-db | awk "{print \$3}")
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

docker build -t $REGISTRY/hacc-db:$TAG .
