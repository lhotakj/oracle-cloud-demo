#!/bin/bash +x
PYTHON3=python3

(
  SCRIPT_DIR=$(readlink -f ${0%/*})
  [ "$1" != "stay" ] && cd "${SCRIPT_DIR}/.."
  echo "[DEBUG] Executing under $($PYTHON3 --version) ..."
  [[ -z "${VIRUAL_ENV}" ]] && echo "[DEBUG] Using virtual environment ..."
  set -a
  if [ -f ./development.env ]; then
    echo "[INFO]  Sourcing './development.env'!"
    . ./development.env
  fi
  if [ -f ./.env ]; then
    echo "[INFO]  Sourcing '.env'!"
    . ./.env
  fi
  echo "[INFO]  Making sure all PIP requirements are installed ..."
  $PYTHON3 -m pip install -r ./requirements.txt -q
  echo "[INFO]  Running app ..."
  export FLASK_APP=app.app
  $PYTHON3 -m flask run --host=0.0.0.0
  set +a
)
