FROM stackbrew/ubuntu:12.04
MAINTAINER Ben Firshman "ben@orchardup.com"
RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-available/default-ssl
ADD proxy.conf /etc/nginx/proxy.conf
RUN cd /etc/nginx/
RUN mv nginx.conf nginx.conf.default
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx"]

