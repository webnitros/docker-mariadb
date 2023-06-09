### Docker контенер c mariadb внутри
================================

```bash
# Клонируем репазиторий
git clone https://github.com/webnitros/docker-mariadb.git

# Создаем образ и импортируем в него setup.sql, имя базы данных mydatabase, имя образа my-new-container
sh docker_build.sh setup.sql mydatabase my-new-build

# запускаем контенер my-container на порту 13308 из образа my-new-build
sh docker_run.sh my-container 13308 my-new-build

```

```bash
# Вход в контенер
docker exec -it my-container /bin/bash
# Логи
docker logs my-container
```

```
(there was is initialization here, therefore we win)

2018-06-08 21:15:55 0 [Note] mysqld (mysqld 10.3.7-MariaDB-1:10.3.7+maria~jessie) starting as process 1 ...
2018-06-08 21:15:55 0 [Note] InnoDB: Using Linux native AIO
2018-06-08 21:15:55 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
2018-06-08 21:15:55 0 [Note] InnoDB: Uses event mutexes
2018-06-08 21:15:55 0 [Note] InnoDB: Compressed tables use zlib 1.2.8
2018-06-08 21:15:55 0 [Note] InnoDB: Number of pools: 1
2018-06-08 21:15:55 0 [Note] InnoDB: Using SSE2 crc32 instructions
2018-06-08 21:15:55 0 [Note] InnoDB: Initializing buffer pool, total size = 256M, instances = 1, chunk size = 128M
2018-06-08 21:15:55 0 [Note] InnoDB: Completed initialization of buffer pool
2018-06-08 21:15:55 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
2018-06-08 21:15:56 0 [Note] InnoDB: 128 out of 128 rollback segments are active.
2018-06-08 21:15:56 0 [Note] InnoDB: Creating shared tablespace for temporary tables
2018-06-08 21:15:56 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
2018-06-08 21:15:56 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
2018-06-08 21:15:56 0 [Note] InnoDB: 10.3.7 started; log sequence number 1639605; transaction id 39
2018-06-08 21:15:56 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
2018-06-08 21:15:56 0 [Note] Plugin 'FEEDBACK' is disabled.
2018-06-08 21:15:56 0 [Note] Server socket created on IP: '::'.
2018-06-08 21:15:56 0 [Warning] 'proxies_priv' entry '@% root@9977cc179be0' ignored in --skip-name-resolve mode.
2018-06-08 21:15:56 0 [Note] InnoDB: Buffer pool(s) load completed at 180608 21:15:56
2018-06-08 21:15:56 0 [Note] Reading of all Master_info entries succeded
2018-06-08 21:15:56 0 [Note] Added new Master_info '' to hash table
2018-06-08 21:15:56 0 [Note] mysqld: ready for connections.
Version: '10.3.7-MariaDB-1:10.3.7+maria~jessie' socket: '/var/run/mysqld/mysqld.sock' port: 3306 mariadb.org binary distribution

```

```

docker run -it --rm --link my-container mariadb:latest mysql -hmy-container -uroot -proot mydatabase -e "select * from phinxlog;"
+---------+
| myfield |
+---------+
| Hello |
| Dolly |
+---------+

```

```php
<?php

$dbhost = '127.0.0.1:13308';
$dbuser = 'root';
$dbpass = 'root';
$dbname = 'mydatabase'; // Замените на имя вашей базы данных

$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname, 3307);

if ($conn->connect_error) {
die('Could not connect: ' . $conn->connect_error);
}

echo 'Connected successfully';

// Выполнение запроса для получения списка таблиц
$query = "SHOW TABLES";
$result = $conn->query($query);

// Проверка результата запроса и вывод списка таблиц
if ($result) {
    while ($row = $result->fetch_row()) {
    echo $row[0] . "<br>";
}
} else {
    echo 'Error: ' . $conn->error;
}

$conn->close();
```
