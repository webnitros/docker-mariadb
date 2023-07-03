```
docker login cr.selcloud.ru
token
CRgAAAAABtIpQC1Q7xftdYOx7ihg0F9ymiTiE0F8
```

```
# Elastisearch
docker commit fandeco-master-elastic fandeco-elastic-image
docker tag fandeco-elastic-image cr.selcloud.ru/fandeco-elastic/elastic:first
docker push cr.selcloud.ru/fandeco-elastic/elastic:first

# 
docker pull cr.selcloud.ru/fandeco-elastic/elastic:first
```

```
# Redis
docker commit fandeco-redis fandeco-redis-image
docker tag fandeco-redis-image cr.selcloud.ru/fandeco-elastic/redis:last
docker push cr.selcloud.ru/fandeco-elastic/redis:first
```

```
# Mysql
docker commit fandeco-mysql fandeco-redis-image
docker tag fandeco-mysql-image cr.selcloud.ru/fandeco-elastic/mysql:last
docker push cr.selcloud.ru/fandeco-elastic/mysql:first
```

```
# Memcached
docker commit fandeco-master-memcached memcached
docker tag memcached cr.selcloud.ru/fandeco-elastic/memcached:last
docker push cr.selcloud.ru/fandeco-elastic/memcached:first
```
