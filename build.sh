#!/bin/sh

# Store current path
SCRIPT_PATH=$(pwd)

# Retrieve version
TAG=$(cat composer.json | jq -r '.version')

# Updating git repository
if [ ! -d processmaker/.git ]; then
    rm -rf processmaker
    git clone https://github.com/ProcessMaker/processmaker.git
else
    cd $SCRIPT_PATH/processmaker && git fetch --all
fi

# Checkout version
cd $SCRIPT_PATH/processmaker && git checkout $(cat $SCRIPT_PATH/version)

# Build image
cd $SCRIPT_PATH && docker build -f Dockerfile.sdk -t processmaker/docker-executor-php:$TAG .


