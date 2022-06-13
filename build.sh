#!/bin/sh

# Retrieve version
TAG=$(cat composer.json | jq -r '.version')

# Build image
cd $SCRIPT_PATH && docker build -f Dockerfile.sdk -t processmaker/docker-executor-php:$TAG .


