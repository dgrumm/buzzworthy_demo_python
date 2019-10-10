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

echo "Exporting path for Python, assumes package was installed"
export PATH=$PATH:${PKG_BASE_DIR}/python-2.7/bin/
ehco "Python version"
python -V

echo "Starting buzzworthy webapp"
pushd pushd ${PKG_BASE_DIR}/${APPLICATION_NAME}
python webapp.py

echo "=-=-= END start.sh =-=-="
