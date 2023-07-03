# Для разработки и тестирования

Нужно скачать snapshot и положить в папку `elasticsearch/data/snapshot`.
snapshot разворачивает индекс с товарами в эластик 
Для импорта используется файл

```bash
sh import-data.sh
```


```bash
docker build -t my-elasticsearch:7.9.2 .
docker run -d -p 19000:9200 --name myelastic my-elasticsearch:7.9.2
docker exec -it fandeco-demo20-elastic /bin/bash
```


```bash
curl -X GET "http://localhost:19000/_cat/indices?h=index"
curl -X GET "http://localhost:9200/_cat/indices"
curl -X GET "http://localhost:19000/_cat/indices?h=index"
curl -X GET "http://localhost:19000/_cat/indices?pretty=true"
curl -X GET "http://localhost:19000/products/_search"

curl -XGET "https://deploy50.massive.ru/elastic/products_deploy50/_count"
curl -XGET "https://deploy50.massive.ru/elastic/products_deploy50/_count"



curl -X GET "https://elastic.massive.ru:9200/products_deploy50/_search"
curl -X GET "http://localhost:9200/products/_search"
curl -X GET "http://localhost:9200/products/_stats"
curl -X PUT "http://localhost:9200/products"
curl -X GET "http://localhost:9200/_cluster/health/products?pretty"

curl -X GET "http://localhost:9200/products_dev16/_count"
curl -X GET "http://localhost:9200/products/_stats"
curl -X GET "http://localhost:9200/_cat/indices"
curl -X GET "http://localhost:9200/_cat/indices?h=index"

curl -XPUT "http://localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d '{
  "persistent": {
    "reindex.remote.whitelist": ["*"]
  }
}'


curl -X PUT "http://localhost:9200/_snapshot/products_10" -H 'Content-Type: application/json' -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/backups",
    "compress": true
  }
}'



curl -X POST "<новый_сервер>:9200/_snapshot/<repository_name>/_restore" -H 'Content-Type: application/json' -d '{
  "indices": "<index_name>",
  "ignore_unavailable": true,
  "include_global_state": true
}'


curl -X PUT "http://localhost:9200/_snapshot/products_10" -H 'Content-Type: application/json' -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/backups",
    "compress": true
  }
}'

curl -X POST "http://localhost:9200/_snapshot/products_10/snapshot/_restore" -H 'Content-Type: application/json' -d '{
  "indices": "products_dev16",
  "ignore_unavailable": true,
  "include_global_state": true
}'


curl -X GET "http://localhost:9200/products_dev16/_count"
curl -X GET "http://localhost:19000/products_dev16/_count"
curl -X GET "http://localhost:19001/products_dev16/_count"

docker rm myelastic -f && docker build -t my-elasticsearch:7.9.2 . && docker run -d -p 19000:9200 --name myelastic my-elasticsearch:7.9.2 && docker exec -it myelastic /bin/bash -c "/usr/share/elasticsearch/import-data.sh"

docker exec -it myelastic /bin/bash

docker run -d -p 19001:9200 --name myelastic2 my-elasticsearch:7.9.2 && docker exec -it myelastic2 /bin/bash -c "/usr/share/elasticsearch/import-data.sh"



docker commit myelastic myelastic-build


docker run -d -p 19200:9200 --name myelastic-searh myelastic-build && docker exec -it myelastic-searh /bin/bash


docker exec -it fandeco-master-elastic /bin/bash 
docker exec -it fandeco-master-elastic /bin/bash 



```


```bash
docker login cr.selcloud.ru
token
CRgAAAAABtIpQC1Q7xftdYOx7ihg0F9ymiTiE0F8

docker tag myelastic-build cr.selcloud.ru/fandeco-elastic/myelastic:first
docker push cr.selcloud.ru/fandeco-elastic/myelastic:first

docker pull cr.selcloud.ru/fandeco-elastic/myelastic:first





docker run -d -p 19201:9200 --name selectel-docker cr.selcloud.ru/fandeco-elastic/myelastic:first && docker exec -it selectel-docker /bin/bash

```
