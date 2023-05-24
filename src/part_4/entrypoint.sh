#!/bin/bash

gcc -c miniServer.c
gcc -o miniServer miniServer.o -lfcgi
spawn-fcgi -p 8080 ./miniServer
nginx -g "daemon off;"
