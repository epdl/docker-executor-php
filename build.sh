#!/bin/sh

cd processmaker

# Retrieve version
TAG=$(cat composer.json | jq -r '.version')

# Build image
docker build -f Dockerfile.sdk -t processmaker/docker-executor-php:$TAG .


