```bash
docker build -t my-redis:3.2.12 .
docker run -d --name fandeco-redis -p 16379:6379 my-redis:3.2.12
docker exec -it fandeco-redis /bin/bash
```

# Публикация контенера

```bash

# Контенер должен быть запущен
# фиксируем изменения в контенере
docker commit fandeco-redis fandeco-redis-image

# создает тег
docker tag fandeco-redis-image cr.selcloud.ru/fandeco-elastic/redis:first

# отправляем изменения на сервере
docker push cr.selcloud.ru/fandeco-elastic/redis:first

docker pull cr.selcloud.ru/fandeco-elastic/redis:first
```
