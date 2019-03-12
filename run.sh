#!/bin/bash

# Starts Alastria Access Point as a standalone proxy
docker run --name Alastria_Access_Point -it -d --net=host alastria/alastria-access-point

