#!/bin/bash

if [ ! $# -eq 1 ]; then
  echo "Error: Expecting version"
  exit 1
else
  if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Version $1"
  else
    echo "Error: Invalid version"
    exit 1
  fi
fi

docker tag circleci-build-container gregmagolan/circleci-build-container:$1
docker push gregmagolan/circleci-build-container:$1