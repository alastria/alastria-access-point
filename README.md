# Alastria Access Point
Alastria Access Point is a proxy that filters and forwards client requests to Alastria Node internal services.

## Getting Started
This is a work in progress. Access Point is primarily designed to limit exposure of Alastria Node services by filtering requests coming from outside of the network. Currently calls to **eth**, **net** and **web3** RPC API families are allowed through the proxy filter. Any other family is blocked, and its methods can only be called locally. It also provides a whitelist/blacklist mechanism and can prevent some DoS attacks.

Note that Alastria Access Point is shipped along with the official Alastria Node docker images for regular and validator nodes, and enabled in whitelist mode by default. You should only use this repository in case you want to run Access Point as a standalone proxy and your node security requires further configuration tweaking.

## Prerequisites

Docker is used to deploy Alastria Access Point. Check how to [install Docker](https://docs.docker.com/install/) for your platform.

In order to run Alastria Access Point, Alastria Node must be started in local-only RPC mode. This is done by passing an optional argumental to the script that starts the node.

``./start.sh --local-rpc``

## Installation

First of all clone this repository

``git clone https://github.com/alastria/alastria-access-point.git``

Then you will have two options to run the container

### Using Alastria's official docker image
```
./alastria-access-point/run.sh
```

### Building your own image
```
cd ./alastria-access-point/
docker build -t alastria-access-point .
docker run --name Alastria_Access_Point -v $(pwd)/nginx/conf.d:/etc/nginx/conf.d -it -d --net=host alastria-access-point
```
## Tools

### Adding/Removing IP addresses to the Whitelist
You can add or remove specific IP addresses by executing the ``allow-ip.sh`` script:
```
./allow-ip.sh PROXY [-r] IP_ADDRESS_0 [ IP_ADDRESS_1 [ IP_ADDRESS_N ] ]
```
Basic usage example, by adding and then removing an IP address:
```
./allow-ip.sh nginx 1.2.3.4
./allow-ip.sh nginx -r 1.2.3.4
```

### Reloading proxy configuration
If you made some changes to the proxy* configuration you would need to update it inside the container. You can execute the script:
```
./reload-config.sh PROXY
```
\* Right now **nginx** is the only supported proxy. 
