FROM node:latest

MAINTAINER yazashin <akabeko.415@gmail.com>

RUN apt-get -q update
RUN apt-get -qy install vim unzip gzip git-core redis-server supervisor
RUN npm install -g yo generator-hubot coffee-script

####
# Configration Supervisor
####
RUN touch /etc/supervisord.conf
RUN echo '[supervisord]'  >> /etc/supervisord.conf
RUN echo 'nodaemon=true'  >> /etc/supervisord.conf
RUN echo '[program:nginx]' >> /etc/supervisord.conf
RUN echo 'command=nginx'   >> /etc/supervisord.conf

EXPOSE 8080
CMD /usr/bin/supervisord -c /etc/supervisord.conf

####
# Create User
####
RUN adduser --disabled-password --gecos "" sunny3; \
    echo "sunny3 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
