#!/bin/bash

docker build . -t circleci-build-container
docker run -i --entrypoint=/bin/bash -t circleci-build-container
