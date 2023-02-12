#!/bin/bash +x
PYTHON3=python3
THREADS="${GUNICORN_THREADS:-3}"
WORKERS="${GUNICORN_WORKERS:-1}"

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
  echo "[INFO]  Logging into '${LOG_FOLDER}' ..."
  mkdir -p "${LOG_FOLDER}"
  echo "[INFO]  Making sure all PIP requirements are installed ..."
  $PYTHON3 -m pip install -r ./requirements.txt -q
  echo "[INFO]  Running app in ${THREADS} thread(s) / ${WORKERS} worker(s) ..."
  gunicorn --bind 0.0.0.0:5000 --threads=${THREADS} --workers=${WORKERS} app.app:app
  set +a
)
