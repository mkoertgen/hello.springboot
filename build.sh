#!/bin/bash -ex
VCS_REF=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
# override ARTIFACT_VERSION with TRAVIS_TAG if set
ARTIFACT_VERSION=${TRAVIS_TAG:-0.1.0}
docker-compose build
