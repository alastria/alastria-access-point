# Alastria Access Point
Alastria Access Point is a proxy that filters and forwards client requests to Alastria Node internal services.

## Getting Started
This a work in progress. Access Point is primarily designed to limit exposure of Alastria Node services by filtering requests coming from outside of the network. Currently calls to **eth**, **net** and **web3** RPC API families are allowed through the proxy filter. Any other family is blocked, and its methods can only be called locally. 

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
$ docker run --network=host -d alastria-access-point
```

Verify that the RPC API is listening on the local interface.

``$ ps -aux | grep geth``

``geth --datadir /home/ubuntu/alastria/data --networkid 82584648528 --identity REG_XXXXX_TestNet_2_4_00 --permissioned --rpc --rpcaddr ``**``127.0.0.1``**`` --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,istanbul --rpcport 22000 --port 21000 --istanbul.requesttimeout 10000 ...``
