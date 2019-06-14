#!/usr/bin/env bash

if [[ $# -ne 1 ]] ; then
    echo 'Usage: ./setup.sh INSTANCE_NAME'
    exit 0
fi

if [[ "$1" = "uat" ]] || [[ "$1" = "science" ]] || [[ "$1" = "prod" ]] ; then
    echo $1 > instance
else
    echo 'INSTANCE_NAME must be one of [uat, science, prod]'
    exit 0
fi
