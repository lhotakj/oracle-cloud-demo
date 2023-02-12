ARG IMAGE=python:3.11.1-alpine3.17
FROM remote-docker.artifactory.dbgcloud.io/$IMAGE

# FROM alexberkovich/alpine-anaconda3:latest

ARG GUNICORN_WORKERS=1
ARG GUNICORN_THREADS=3

ENV GUNICORN_WORKERS $GUNICORN_WORKERS
ENV GUNICORN_THREADS $GUNICORN_THREADS

LABEL maintainer="lhotakj@gmail.com"
LABEL org.opencontainers.image.title="Demo Oracle"
LABEL org.opencontainers.image.url="https://github.com/lhotakj/oracle-cloud-demo"

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip && \
    pip install -r ./requirements.txt
EXPOSE 5000

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

