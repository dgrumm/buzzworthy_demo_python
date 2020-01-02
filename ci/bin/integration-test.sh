#!/bin/bash

set -e
STATUS=$(curl --silent --output /dev/stderr --write-out "%{http_code}" http://buzz-integration.gr.calculi.io)
if [ "$STATUS" != 200 ]; then 
  echo "Buzz application is not running. Exiting!"
  exit 1
else
  echo "Buzz application is running at http://buzz-integration.gr.calculi.io"
fi
set +e
