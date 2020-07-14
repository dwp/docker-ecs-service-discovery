#!/bin/sh
set -e

mkdir -p $SERVICE_DISCOVERY_DIRECTORY

python /bin/discoverecs.py \
    --directory $SERVICE_DISCOVERY_DIRECTORY
