#!/bin/bash

echo "Snapshop and restore"

# Ожидание запуска Elasticsearch
echo "Ожидание запуска Elasticsearch..."
until curl -s http://localhost:9200 >/dev/null; do
  sleep 1
done
echo "Elasticsearch запущен."

echo "Create repository"
echo ""

curl -X PUT "http://localhost:9200/_snapshot/products_10" -H 'Content-Type: application/json' -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/snapshot",
    "compress": true
  }
}'

echo ""
echo "Restore shapshot"
echo ""
curl -X POST "http://localhost:9200/_snapshot/products_10/snapshot/_restore?wait_for_completion=true" -H 'Content-Type: application/json' -d '{
  "indices": "products_dev16",
  "ignore_unavailable": true,
  "include_global_state": true
}'

echo "Count products_dev16"
echo ""

curl -X GET "http://localhost:9200/products_dev16/_count"
echo ""
