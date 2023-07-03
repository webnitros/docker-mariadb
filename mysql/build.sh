#!/bin/bash

# sh build.sh divinare-mysql
# собирать контейнер с именем my-new-container
docker build --tag "$1" .
