FROM ubuntu:18.04

RUN apt-get update -y

# enable ssh
RUN apt-get install -y gnupg2 openssh-client
RUN mkdir -p ~/.ssh
COPY bin/ssh-config.sh /usr/bin

# enable wget
RUN apt-get install -y wget

# enable cURL
RUN apt-get install -y curl
