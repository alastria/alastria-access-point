FROM envoyproxy/envoy:latest
RUN apt-get update && apt-get upgrade -y
COPY envoy-config.yaml /etc/envoy.yaml
CMD /usr/local/bin/envoy -c /etc/envoy.yaml --v2-config-only
