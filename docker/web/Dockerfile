FROM python:3.10-alpine3.17 as base

ARG DOCKER_UID
ARG DOCKER_GID

RUN apk add --no-cache bash sudo

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# create user ubuntu
RUN adduser ubuntu -D -u $DOCKER_UID -h /home/ubuntu -s /bin/bash

# install dependencies for mysqlclient and react
RUN apk update \
  && apk add --virtual build-deps gcc musl-dev \
  && apk add --no-cache mariadb-dev nodejs npm

# install virtualenv
RUN pip install virtualenv
# enviorment variables
ENV PATH="/var/www/html/app/docker/web/:$PATH"

WORKDIR /var/www/html/app



# Development image
FROM base as development

USER root
# install dev dependencies
RUN apk add --no-cache bash sudo nmap git nano

# add user ubuntu to sudoers
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/ubuntu
RUN chmod 0440 /etc/sudoers.d/ubuntu

RUN npm install -g aicommits

# helper command
USER ubuntu
RUN echo "alias listening='lsof -i -P -n | grep LISTEN'" >> /home/ubuntu/.bashrc
RUN echo "alias ll='ls -alFh'" >> /home/ubuntu/.bashrc
RUN echo "source env/bin/activate" >> /home/ubuntu/.bashrc
