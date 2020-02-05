#!/usr/bin/env bash
set -ex

HERE=$(dirname $0)
REGISTRY=docker.montagu.dide.ic.ac.uk:5000
NAME=orderlyweb-copy-documentation
TAG=$REGISTRY/$NAME

docker build --tag $TAG $HERE
docker push $TAG
