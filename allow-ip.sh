#!/bin/bash

# Adds IP address to nginx whitelist

if [ -z "$1" ]; then
        echo "$0: insufficient arguments"
        echo "Usage: ./allow-ip.sh PROXY [ -r ] IP_ADDRESS_0 [ IP_ADDRESS_1 [ IP_ADDRESS_N ] ]"
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
        if [ $2 = "-r" ]; then
                for IP in "${@:3}"
                do
                        docker exec $DOCKER_ID bash -c "sed -i '/$IP/d' /etc/nginx/whitelist"
                done
        else
                for IP in "${@:2}"
                do
                        docker exec $DOCKER_ID bash -c "echo \"allow $IP;\" >> /etc/nginx/whitelist"
                done
        fi
        docker exec "$DOCKER_ID" nginx -s reload
fi
