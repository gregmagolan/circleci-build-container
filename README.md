## Docker container for CircleCI builds

From `circleci/node:8.5.0-browsers` docker image. This is a Debian GNU/Linux 8 amd64 jessie release with a 4.9.41-moby kernel.

Using a circleci base image speeds up the `Spin up Environment` step as this image is always cached on CircleCI.

### From circleci/node:8.5.0-browsers:

* node 8.5.0
* npm 5.3.0
* yarn 1.0.2
* python 2.7.13
* git 2.1.4
* curl 7.38.0
* wget 1.16
* gcc (Debian 6.3.0-18) 6.3.0
* docker 17.06.2-ce
* docker-compose 1.16.1
* dockerize 0.5.0
* Google Chrome 61.0.3163.100
* Mozilla Firefox 47.0.1

### Installed

* rsync 3.1.1
* Zulu OpenJDK 8.15.0.1
* Bazel 0.5.4
* brotli 0.5.2
