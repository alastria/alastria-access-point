#!/bin/bash

# Starts Alastria Access Point as a standalone proxy
docker run --name Alastria_Access_Point -v $(pwd)/nginx:/etc/nginx -it -d --net=host alastria/alastria-access-point

