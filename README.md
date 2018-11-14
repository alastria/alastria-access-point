# Alastria Access Point
Alastria Access Point is a proxy that filters and forwards client requests to Alastria Node internal services. It relies on Envoy front-proxy capabilities. [Envoy](https://www.envoyproxy.io/) is an open source edge and service proxy, designed for cloud-native applications.

## Getting Started

### Prerequisites
In order to run Alastria Access Point, Alastria Node must be started in local-only RPC mode. This is done by passing an optional argumental to the script that starts the node.

``./start.sh --local-rpc``

Docker is used to deploy the Acces Point. Check how to [install Docker](https://docs.docker.com/install/) for your platform.
