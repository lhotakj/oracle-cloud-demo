#!/bin/bash +x
PYTHON3=python3
(
  SCRIPT_DIR=$(readlink -f ${0%/*})
  cd "${SCRIPT_DIR}/.."
  $PYTHON3 -m pip install virtualenv
  virtualenv "demo"
  source demo/bin/activate
  $PYTHON3 -m pip install -r ./requirements.txt
)
