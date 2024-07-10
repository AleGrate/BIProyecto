#!/usr/bin/env bash

TAG=DEV_1.0
DOCKER_REGISTRY=nexus.cgtscorp.com:8082
CONTAINER_NAME=hacc-db

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker run -d --name $CONTAINER_NAME -p 5555:5432 --restart always $DOCKER_REGISTRY/$CONTAINER_NAME:$TAG;

sleep 20

export PGPASSWORD=sys64738
#psql -h localhost -U postgres -p 5555 -d haccdb -a -f INITIAL_LOAD/01_SETUP_HACCSEC.sql
#psql -h localhost -U postgres -p 5555 -d haccdb -a -f INITIAL_LOAD/02_SETUP_HACC.sql
#psql -h localhost -U postgres -p 5555 -d haccdb -a -f INITIAL_LOAD/03_ALTER_HACC.sql
#psql -h localhost -U postgres -p 5555 -d haccdb -a -f INITIAL_LOAD/04_INSERT_HACC.sql

export PGCLIENTENCODING=UTF8

for file in INITIAL_LOAD/*.sql; do
   psql -h localhost -U postgres  -p 5555 -d haccdb -a -f "$file"
done