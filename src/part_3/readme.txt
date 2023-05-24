docker run -d -p 81:81 nginx 
docker exec -it name bash
docker cp ./miniServer.c name:/home/
docker cp ./nginx/nginx.conf name:/etc/nginx/

spawn-fcgi libfcgi-dev gcc
gcc -c miniServer.c
gcc -o miniServer miniServer.o -lfcgi
spawn-fcgi -p 8080 ./miniServer
reload nginx
