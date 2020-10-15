#!/bin/bash

USAGE="Usage: $(basename $0) <ip> <ssh-private-key> [port]"

if [ $# -lt 2 ]; then
	echo "$USAGE"
	exit 1
fi

IP=$1
KEY=$2
PORT=22
if [ $# -eq 3 ]; then
	IP=$3
fi

echo "$KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 700 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-keyscan -p $PORT -H $IP >> ~/.ssh/known_hosts
