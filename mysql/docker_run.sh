#!/bin/bash

c_name="$1"
c_port="$2"
c_build="$3"


if [ -z "$c_name" ]; then
  echo "Error: No tag name provided for the container."
  exit 1
fi

if [ -z "$c_port" ]; then
  echo "Error: No port provided for the container."
  exit 1
fi
if [ -z "$c_build" ]; then
  echo "Error: No build provided for the container."
  exit 1
fi

echo "Running container $c_name on port $container_port"
echo "Build: $c_build"

docker run -d --rm --name "$c_name" -p "$c_port":3306 "$c_build"

#docker run -d --rm --name my-container-1 -p 13308:3306 my-new-container2
#docker run -d --rm --name my-container-1 -p 13308:3306 my-new-container2
