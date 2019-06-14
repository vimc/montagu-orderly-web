#!/usr/bin/env bash
set -ex

if [[ $# -ne 1 ]] ; then
    echo 'Usage: ./start.sh INSTANCE_NAME'
    echo 'where INSTANCE_NAME is one of [uat, science, prod]'
    exit 0
fi

orderly-web start ./config --extra $1
