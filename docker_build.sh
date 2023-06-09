#!/bin/bash

database_file="database.sql"
setup_file="$1"
bdname="$2"
tag_name="$3"

if [ -z "$setup_file" ] || [ ! -f "$setup_file" ]; then
  echo "Error: Sql file not provided or does not exist."
  exit 1
fi

if [ -z "$tag_name" ]; then
  echo "Error: No tag name provided for the container."
  exit 1
fi

if [ -z "$bdname" ]; then
  bdname="mydatabase"
fi

rm -f "$database_file"
echo "CREATE DATABASE $bdname;\n\nUSE $bdname;\n" >"$database_file"
cat "$setup_file" >>"$database_file"

# собирать контейнер с именем my-new-container
docker build --tag "$tag_name" .
