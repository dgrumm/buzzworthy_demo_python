#!/usr/bin/env bash
set -exuo pipefail

echo "=-=-=-=-=-=-=-=-=-="
echo "ECHO environment from inside install-and-start.sh"
printenv | sort
pwd
ls -lR

echo "=-=-=-=-=-=-=-=-=-="
echo "ECHO python3 installed?"
which python3
python3 --version
which pip
pip --version

echo "=-=-=-=-=-=-=-=-=-="
echo "ECHO create venv, install dependencies"
pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
python3 -m virtualenv venv
./venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
popd

echo "=-=-=-=-=-=-=-=-=-="
#echo "RUN apt-get update"
#sudo apt-get install -y --no-install-recommends python3-pip
#echo "=-=-=-=-=-=-=-=-=-="
#echo "Hail Mary"
# curl https://bootstrap.pypa.io/3.3/get-pip.py --output get-pip.py && python get-pip.py --user
# pushd .local/bin
# ./pip install -r requirements --user
# popd

#echo "RUN pip install"
#pip3 install -r requirements.txt
echo "=-=-=-=-=-=-=-=-=-="
echo "START buzzworthy webapp"
pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
python3 webapp.py
#python webapp.py

echo "=-=-=-=-=-=-=-=-=-="
