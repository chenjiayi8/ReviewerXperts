FROM python:3.10-alpine3.17 as base

ARG DOCKER_UID
ARG DOCKER_GID

RUN apk add --no-cache bash sudo

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# create user ubuntu
RUN adduser ubuntu -D -u $DOCKER_UID -h /home/ubuntu -s /bin/bash

WORKDIR /home/ubuntu

# install dependencies
COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

RUN pip install gunicorn --no-cache-dir

WORKDIR /var/www/html/app



# Development image
FROM base as development

USER root
# install dev dependencies
RUN apk add --no-cache bash sudo nmap git

# add user ubuntu to sudoers
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/ubuntu
RUN chmod 0440 /etc/sudoers.d/ubuntu
