#!/usr/bin/env bash
set -ex

GIT_ID=$(git rev-parse --short=7 HEAD)
GIT_BRANCH=$(git symbolic-ref --short HEAD)

HERE=$(dirname $0)
REGISTRY=vimc
REGISTRY_PUBLIC=vimc
NAME=montagu-orderlyweb-copydocs

BRANCH_TAG=$REGISTRY/$NAME:$GIT_ID
COMMIT_TAG=$REGISTRY/$NAME:$GIT_ID

docker build --tag $BRANCH_TAG --tag $COMMIT_TAG $HERE
docker push $BRANCH_TAG
docker push $COMMIT_TAG

if [ "$GIT_BRANCH" == "master" ]; then
    PUBLIC_COMMIT_TAG=$REGISTRY_PUBLIC/$NAME:$GIT_ID
    PUBLIC_BRANCH_TAG=$REGISTRY_PUBLIC/$NAME:$GIT_BRANCH
    docker tag $BRANCH_TAG $PUBLIC_BRANCH_TAG
    docker tag $BRANCH_TAG $PUBLIC_COMMIT_TAG
    docker push $PUBLIC_BRANCH_TAG
    docker push $PUBLIC_COMMIT_TAG
fi
