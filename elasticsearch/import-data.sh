#!/bin/bash

echo "Snapshop and restore"

# Проверка наличия индекса
if ! curl -s -XHEAD "http://localhost:9200/products_dev16" >/dev/null; then

  # Ожидание запуска Elasticsearch
  echo "Ожидание запуска Elasticsearch..."
  until curl -s http://localhost:9200 >/dev/null; do
    sleep 1
  done
  echo "Elasticsearch запущен."

  echo "Create repository"

  curl -X PUT "http://localhost:9200/_snapshot/products_10" -H 'Content-Type: application/json' -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/snapshot",
    "compress": true
  }
}'

  echo "Create Restore"

  curl -X POST "http://localhost:9200/_snapshot/products_10/snapshot/_restore?wait_for_completion=true" -H 'Content-Type: application/json' -d '{
  "indices": "products_dev16",
  "ignore_unavailable": true,
  "include_global_state": true
}'

  echo "Count products_dev16"
  curl -X GET "http://localhost:9200/products_dev16/_count"
else
  echo "Индекс 'products_dev16' уже существует. Пропускаю выполнение кода."
fi
