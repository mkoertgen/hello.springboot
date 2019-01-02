#!/bin/bash -ex
VCS_REF=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
# override DOCKER_TAG with TRAVIS_TAG if set
export DOCKER_TAG=${TRAVIS_TAG:-9.2.5}
docker-compose build
