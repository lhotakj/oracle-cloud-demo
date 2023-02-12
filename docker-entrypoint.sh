#!/bin/sh
set -e
echo "Exposing Gunicorn on port 5000 ..."
echo "GUNICORN_WORKERS: ${GUNICORN_WORKERS}"
echo "GUNICORN_THREADS: ${GUNICORN_THREADS}"

gunicorn --bind 0.0.0.0:5000 --threads="${GUNICORN_THREADS}" --workers="${GUNICORN_WORKERS}" app.app:app