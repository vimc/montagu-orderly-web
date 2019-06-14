#!/usr/bin/env bash
set -ex

instance=$(cat instance)

if [[ "$instance" = "uat" ]] || [[ "$instance" = "science" ]] || [[ "$instance" = "prod" ]] ; then
    orderly-web start ./config --extra $instance
else
    echo 'You must run ./setup.sh to configure the instance name'
    exit 0
fi
