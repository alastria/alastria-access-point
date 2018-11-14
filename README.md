# Alastria Access Point
Alastria Access Point is a proxy that filters and forwards client requests to Alastria Node internal services. It relies on Envoy front-proxy capabilities. [Envoy](https://www.envoyproxy.io/) is an open source edge and service proxy, designed for cloud-native applications.

## Getting Started

### Prerequisites
In order to run Alastria Access Point, Alastria Node must be started in local-only RPC mode. This is done by passing an optional argumental to the script that starts the node.

``./start.sh --local-rpc``

Docker is used to deploy the Acces Point. Check how to [install Docker](https://docs.docker.com/install/) for your platform.

### Installation
To install directly from sources, clone this repository, build the Docker image and run the Access Point container.

```
$ git clone https://github.com/alastria/alastria-access-point.git
$ cd ./alastria-access-point/
$ docker build -t alastria-access-point .
$ docker run -rm --network=host -d -p 22001:22001 alastria-access-point
```

Verify that the RPC API is listening on the local interface.

``$ ps -aux | grep geth``

``geth --datadir /home/ubuntu/alastria/data --networkid 82584648528 --identity REG_XXXXX_TestNet_2_4_00 --permissioned --rpc --rpcaddr ``**``127.0.0.1``**`` --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul --rpcport 22000 --port 21000 --istanbul.requesttimeout 10000 ...``
