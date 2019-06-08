#!/usr/bin/env bash

## this script will install dependencies for the application

echo "ECHO environment"
printenv | sort
echo "=-=-=-=-=-=-=-=-=-="

echo "ECHO file listing"
ls -lR
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN apt-get update"
apt-get install -y --no-install-recommends python-pip
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN pip install"
pip install -r requirements.txt
echo "=-=-=-=-=-=-=-=-=-="

echo "START buzzworthy webapp"
python webapp.py
