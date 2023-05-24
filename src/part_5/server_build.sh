#!/bin/bash

sudo export DOCKER_CONTENT_TRUST=1
docker build -t miniserver:stable .
docker create miniserver
docker run -d -p 80:81 -v $(pwd)/nginx/:/etc/nginx/ miniserver:stable
