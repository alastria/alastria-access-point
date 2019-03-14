FROM ubuntu:16.04

MAINTAINER "Andrés Alonso" <andres.alonso@alisys.net>

RUN apt-get update && \
    apt-get upgrade -y && \ 
    apt-get install -y \
        nginx \
	nginx-extras

RUN rm -Rf /etc/nginx/sites-enabled/default
RUN rm -Rf /etc/nginx/sites-available/default

EXPOSE 80 443

VOLUME /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
