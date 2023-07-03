### Docker контенер c mariadb внутри
================================

```bash
# Создаем образ и импортируем в него setup.sql, имя базы данных mydatabase, имя образа my-new-container
sh docker_build.sh fandeco.sql fandeco fandeco-mysql-image
docker run -d --rm --name fandeco-mysql -p 13308:3306 fandeco-mysql-image

```

```bash
docker exec -it fandeco-mysql /bin/bash
docker logs fandeco-mysql
```

docker build --tag "divinare-mysql-image" .


docker run -d --rm --name "$c_name" -p "$c_port":3306 "$c_build"


```bash
sh sql.sh dumps/divinare_kz-4.sql

docker build --tag divinare-mysql10 .
docker rm my_container_mysql -f
docker run -d --rm --name my_container_mysql -p 33022:3306 divinare-mysql10
docker exec -it my_container_mysql /bin/bash

# commit нужен чтобы выполнить фиксацию
docker commit my_container_mysql divinare-kz-mysql10
# тег чтобы определить тег для внешнего образа
docker tag divinare-kz-mysql10 cr.selcloud.ru/divinare-kz/mysql10:last
# финальный шаг загрузка образ
docker push cr.selcloud.ru/divinare-kz/mysql10:last

docker login cr.selcloud.ru
test
token
CRgAAAAACZDELvS3kts70w8WVhEyYMY7DKIttjAD
```

# На сайте
```
docker pull cr.selcloud.ru/divinare-kz/mysql10:last
make remake
```
