#!/usr/bin/env bash
set -exuo pipefail

echo "=-=-=-=-=-=-=-=-=-="
echo "ECHO environment from inside install-and-start.sh"
printenv | sort
echo "=-=-=-=-=-=-=-=-=-="

echo "=-=-=-=-=-=-=-=-=-="
echo "ECHO file listings"
echo "APPLICATION_JOB_DIR"
ls -lR ${APPLICATION_JOB_DIR}

echo "APPLICATION_RUN_DIR"
ls -lR ${APPLICATION_RUN_DIR}

echo "APPLICATION_DATA_DIR"
ls -lR ${APPLICATION_DATA_DIR}

echo "APPLICATION_STORE_DIR"
ls -lR ${APPLICATION_STORE_DIR}

echo "PKG_BASE_DIR"
ls -lR ${PKG_BASE_DIR}

echo "JOBS_BASE_DIR"
ls -lR ${JOBS_BASE_DIR}

echo "RUN_BASE_DIR"
ls -lR ${RUN_BASE_DIR}

echo "LOGS_BASE_DIR"
ls -lR ${LOGS_BASE_DIR}
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN apt-get update"
#apt-get install -y --no-install-recommends python3-pip
echo "=-=-=-=-=-=-=-=-=-="

echo "SETUP Python Virtual Environment"
python3 -m venv venv
. venv/bin/activate
echo "=-=-=-=-=-=-=-=-=-="

echo "RUN pip install"
pip install -r requirements.txt
echo "=-=-=-=-=-=-=-=-=-="

echo "START buzzworthy webapp"
pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
python3 webapp.py
#python webapp.py
echo "=-=-=-=-=-=-=-=-=-="
