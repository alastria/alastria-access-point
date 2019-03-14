#!/bin/sh

# Reloads Alastria Access Point configuration

if [ -z "$1" ]; then
        echo "$0: insufficient arguments, missing PROXY"
        echo "Usage: ./reload-config.sh PROXY"
        exit
fi

if [ $1 = "nginx" ]; then
	DOCKER_ID=""
	DIRECTORY="../../config"
	if [ -d $DIRECTORY ]; then
		DOCKER_ID==$(head -n 1 "$DIRECTORY"/NODE_NAME 2> /dev/null)
	else
		DOCKER_ID=$(docker ps -aqf "name=Access_Point")
	fi
	docker exec "$DOCKER_ID" nginx -s reload
fi
