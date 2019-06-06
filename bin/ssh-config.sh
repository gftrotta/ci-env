#!/bin/bash

USAGE="Usage: $(basename $0) <ip> <ssh-private-key>"

if [ $# -lt 2 ]; then
	echo "$USAGE"
	exit 1
fi

IP=$1
KEY=$2

echo "$KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 700 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-keyscan -H $IP >> ~/.ssh/known_hosts