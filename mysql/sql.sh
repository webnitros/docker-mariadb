#!/bin/bash

# sh sql.sh dump.sql
# sh sql.sh setup.sql
# sh sql.sh dumps/divinare_kz-4.sql

database_file="database.sql"
setup_file="$1"
if [ -z "$setup_file" ] || [ ! -f "$setup_file" ]; then
  echo "Error: Sql file not provided or does not exist."
  exit 1
fi

rm -f "$database_file"
echo "CREATE DATABASE mydatabase; USE mydatabase;" >"$database_file"
cat "$setup_file" >>"$database_file"
