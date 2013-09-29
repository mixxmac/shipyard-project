FROM ubuntu:12.04
MAINTAINER Arcus "http://arcus.io"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN RUNLEVEL=1 DEBIAN_FRONTEND=noninteractive apt-get install -y nginx-full
ADD . /opt/www
RUN chown -R www-data:www-data /opt/www
ADD .docker/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
