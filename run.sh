#!/bin/bash

# Starts Alastria Access Point as a standalone proxy
docker run --name Alastria_Access_Point -v $(pwd)/nginx/conf.d:/etc/nginx/conf.d -it -d --net=host alastria/alastria-access-point

