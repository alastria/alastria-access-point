# Build Geth in a stock Go builder container
FROM ubuntu:16.04 as builder
MAINTAINER "Adrian Pareja" <aparejaa@everis.com>

ARG DOCKER_VERSION=latest
ARG ALASTRIA_BRANCH=develop

RUN apt-get update && \
    apt-get upgrade -y && \ 
    apt-get install -y \
            software-properties-common \
            unzip wget git \
            make gcc libsodium-dev \
            build-essential libdb-dev \
            zlib1g-dev libtinfo-dev \
            sysvbanner psmisc \
            libleveldb-dev libsodium-dev \
            libdb5.3-dev  

ENV GOREL go1.9.5.linux-amd64.tar.gz

RUN wget -q https://storage.googleapis.com/golang/$GOREL && \
    tar xfz $GOREL && \
    mv go /usr/local/go && \
    rm -f $GOREL && \
    git clone https://github.com/alastria/quorum.git && \
    git clone -b $ALASTRIA_BRANCH https://github.com/alastria/alastria-node

ENV GOROOT=/usr/local/go \
    GOPATH=/opt/golang \
    PATH=/usr/local/go/bin:/opt/golang/bin:$PATH

RUN go get -d github.com/alastria/monitor && \ 
    go get -fix -t -u -v github.com/astaxie/beego && \
    go get -fix -t -u -v github.com/beego/bee
    
WORKDIR quorum
RUN git checkout 01bf0f3086f157d0284837adc0451d050773a060 && make geth

# Pull Geth into a second stage deploy alpine container
FROM ubuntu:16.04
MAINTAINER "Adrian Pareja" <aparejaa@everis.com>

ENV IDENTITY = validator
RUN apk add --no-cache ca-certificates \
    && mkdir -p alastria/data
COPY --from=builder /go/quorum/build/bin/geth /usr/local/bin/

EXPOSE 21000 30303 30303/udp
CMD ["sh","-c","geth init --datadir /alastria/data /alastria/data/genesis.json && geth --datadir /alastria/data --networkid 82584648529 --identity $IDENTITY --permissioned --port 21000 --istanbul.requesttimeout 3000 --ethstats $IDENTITY:bb98a0b6442386d0cdf8a31b267892c1@35.231.29.1 --verbosity 3 --vmdebug --emitcheckpoints --targetgaslimit 18446744073709551615 --syncmode full --vmodule consensus/istanbul/core/core.go=5 --mine --minerthreads 1"]
