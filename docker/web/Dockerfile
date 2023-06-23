FROM python:3.10-alpine3.17 as base

ARG DOCKER_UID
ARG DOCKER_GID

RUN apk add --no-cache bash sudo

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# create user ubuntu
RUN adduser ubuntu -D -u $DOCKER_UID -h /home/ubuntu -s /bin/bash

# install dependencies for mysqlclient
RUN apk update \
  && apk add --virtual build-deps gcc python3-dev musl-dev \
  && apk add --no-cache mariadb-dev nodejs npm


WORKDIR /home/ubuntu

# install dependencies for django project
COPY --chown=ubuntu:ubuntu ./backend/requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

RUN apk del build-deps

WORKDIR /var/www/html/app



# Development image
FROM base as development

USER root
# install dev dependencies
RUN apk add --no-cache bash sudo nmap git

# helper command
RUN echo "alias listening='lsof -i -P -n | grep LISTEN'" >> /home/ubuntu/.bashrc
ENV PATH="/var/www/html/app/docker/backend/:$PATH"

# add user ubuntu to sudoers
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/ubuntu
RUN chmod 0440 /etc/sudoers.d/ubuntu
