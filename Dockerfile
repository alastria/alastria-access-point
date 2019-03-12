FROM ubuntu:16.04

MAINTAINER "Andrés Alonso" <andres.alonso@alisys.net>

RUN apt-get update && \
    apt-get upgrade -y && \ 
    apt-get install -y \
            nginx \
	    nginx-extras

RUN rm -Rf /etc/nginx/sites-enabled/default
RUN rm -Rf /etc/nginx/sites-available/default

COPY ./nginx/access-point.conf /etc/nginx/conf.d/access-point.conf
COPY ./nginx/blacklist /etc/nginx/blacklist
COPY ./nginx/whitelist /etc/nginx/whitelist

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
