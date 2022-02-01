#!/bin/sh
#apk update
#apk add postgresql-dev gcc g++ python3 python3-dev musl-dev
#pip install --upgrade pip
#pip install orchestrator-core

apt-get update -y
apt-get install -y postgresql-server-dev-all gcc g++ python3 python3-dev python3-pip musl-dev
pip3 install --upgrade pip
pip3 install orchestrator-core

tail -f /dev/null