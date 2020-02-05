#!/usr/bin/env bash
set -ex

REGISTRY=docker.montagu.dide.ic.ac.uk:5000
NAME=orderlyweb-copy-documentation
IMAGE=$REGISTRY/$NAME

docker run -v documents:/documents $IMAGE $1
