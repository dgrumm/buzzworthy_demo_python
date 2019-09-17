#!/usr/bin/env bash
set -exuo pipefail


echo "ECHO environment from inside install-and-start.sh"
printenv | sort
echo "=-=-=-=-=-=-=-=-=-="

echo "ECHO file listing"
ls -lR ${APPLICATION_JOB_DIR}
cd ${APPLICATION_JOB_DIR}
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN apt-get update"
apt-get install -y --no-install-recommends python3-pip
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN pip install"
pip3 install -r requirements.txt
echo "=-=-=-=-=-=-=-=-=-="

echo "START buzzworthy webapp"
which python3

pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
python3 webapp.py
#python webapp.py
