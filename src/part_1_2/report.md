## Part 1. Ready-made docker

##### Take the official docker image from nginx and download it using docker pull.

"docker search nginx" to find the nginx image.

![1.1.1](img/docker-search.PNG)

"docker pull nginx" to download nginx image.

![1.1.2](img/docker-pull.PNG)

##### Check for the docker image with docker images

"docker images" to check existing docker images.

51086ed63d8c - id

![1.2](img/docker-image.PNG)

##### Run docker image with `docker run -d [image_id|repository]`

"docker run -d 51086ed63d8c"

![1.3](img/docker-run1.PNG)

##### Check that the image is running with `docker ps`

![1.4](img/docker-ps.PNG)

##### View container information with `docker inspect [container_id|container_name]`

"docker inspect %container_id%"

![1.5](img/docker-inspect.PNG)

##### From the command output define and write in the report the container size, list of mapped ports and container ip

"docker inspect %container_id% | grep ShmSize" to see container size

![1.6.1](img/inspect-size.PNG)

"docker inspect %container_id% | grep -n ExposedPort" to know string number(147)

"docker inspect %container_id% | awk '(NR == 148)'" to see next string with port number(148)

![1.6.2](img/inspect-port.PNG)

"docker inspect %container_id% | grep IPAddress"

![1.6.3](img/inspect-ip.PNG)

##### Stop docker image with `docker stop [container_id|container_name]`
##### Check that the image has stopped with `docker ps`

![1.7](img/docker_stop_ps.PNG)

##### Run docker with mapped ports 80 and 443 on the local machine with *run* command

"docker run -d -p 80:80 -p 443:443 %image_id%"

![1.8](img/port_run.PNG)

##### Check that the **nginx** start page is available in the browser at *localhost:80*

![1.9](img/localhost_check.PNG)

##### Restart docker container with `docker restart [container_id|container_name]`
##### Check in any way that the container is running

![1.10](img/docker-restart.PNG)

## Part 2. Operations with container

##### Read the *nginx.conf* configuration file inside the docker container with the *exec* command

![2.0](img/nginx_conf.PNG)

##### Create a *nginx.conf* file on a local machine
##### Configure it on the */status* path to return the **nginx** server status page
##### Copy the created *nginx.conf* file inside the docker image using the `docker cp` command
##### Restart **nginx** inside the docker image with *exec*
##### Check that *localhost:80/status* returns the **nginx** server status page

"docker cp %container_id%:/etc/nginx/conf.d/default.conf ./" - copy default .conf file to local machine

"docker exec %container_id% rm /etc/nginx/conf.d/default.conf" - delete default .conf file

"docker cp nginx.conf %container_id%:/etc/nginx/conf.d/nginx.conf" - copy edited .conf file to container

![2.1](img/new_nginx_conf.PNG)

"docker exec %container_id% nginx -s reload" - reloading server

"curl localhost:80/status" - to check that all works

![2.2](img/curl_status.PNG)


##### Export the container to a *container.tar* file with the *export* command
##### Stop the container

![2.3](img/container_tar.PNG)

##### Delete the image with `docker rmi [image_id|repository]`without removing the container first

![2.4](img/docker_rmi.PNG)

##### Delete stopped container

![2.5](img/removed_container.PNG)

##### Import the container back using the *import* command
##### Run the imported container
##### Check that *localhost:80/status* returns the **nginx** server status page

![2.6](img/docker_import_run_curl.PNG)
