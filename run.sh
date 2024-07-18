#!/usr/bin/env bash

TAG=postgres
DOCKER_REGISTRY=localhost:5000
CONTAINER_NAME=bi-db

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker run -d --name my-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword postgres:$TAG

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