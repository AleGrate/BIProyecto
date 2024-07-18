#!/usr/bin/env bash

#!/usr/bin/env bash

TAG=postgres
REGISTRY=localhost:5000

docker stop my-postgres
docker rm my-postgres

docker build -t $REGISTRY/bi-db:$TAG .