#!/usr/bin/env bash

echo "=-=-= START start.sh =-=-="

# echo "Installing the Consul agent config in the Consul agent data directory"
# cp -f ${APPLICATION_JOB_DIR}/config/${APPLICATION_NAME}-service-registry.json ${DATA_BASE_DIR}/consul/.
# chmod 744 ${DATA_BASE_DIR}/consul/${APPLICATION_NAME}-service-registry.json
#
# echo "Reload Consul to hook up with the Service configuration"
# export CONSUL_HTTP_SSL=true
# export CONSUL_CACERT="${TLS_CA_PATH}/${CONSUL_ENVIRONMENT}.cert.pem"
# export CONSUL_CLIENT_CERT="${TLS_CERTIFICATE}"
# export CONSUL_CLIENT_KEY="${TLS_PRIVATE_KEY}"
#
# ${PKG_BASE_DIR}/consul/bin/consul reload

echo "List deployed packages under PKG_BASE_DIR"
pushd ${PKG_BASE_DIR}
ls -lRa
popd

echo "Exporting path for Python, assumes package was installed"
export PATH=$PATH:${PKG_BASE_DIR}/python-2-7-6/bin/
echo "Path: $PATH"
pushd ${PKG_BASE_DIR}/python-2-7-6/bin/
ls -lRa
popd
echo "Python version:"
python -V

echo "Installing buzzworthy webapp"
pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
echo "What's in the app dir? "
ls -lRa
echo "Install deps"
pip install -r requirements.txt
echo "Start webapp"
python webapp.py

echo "=-=-= END start.sh =-=-="
