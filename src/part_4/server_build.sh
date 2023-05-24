#!/bin/bash

docker build -t miniserver:latest .
docker create miniserver
docker run -d -p 80:81 -v $(pwd)/nginx/:/etc/nginx/ miniserver:latest

