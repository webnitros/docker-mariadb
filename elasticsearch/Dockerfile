# Используем базовый образ Elasticsearch версии 7.9.2
FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.2

# Устанавливаем переменные окружения для Elasticsearch
ENV discovery.type=single-node
ENV http.host=0.0.0.0
ENV transport.host=localhost

# Копируем скрипт, который будет выполняться во время сборки
COPY import-data.sh /usr/share/elasticsearch/import-data.sh
COPY data/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY data/snapshot /usr/share/elasticsearch/snapshot/


# Задаем права на выполнение скрипта
RUN chmod +x /usr/share/elasticsearch/import-data.sh


#RUN echo "unzip backup"

# RUN unzip -q /usr/share/elasticsearch/backups/backup.zip -d /usr/share/elasticsearch/backups/ && rm /usr/share/elasticsearch/backups/backup.zip

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/snapshot


# Запускаем Elasticsearch при старте контейнера
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Запускаем скрипт import-data.sh после старта Elasticsearch
#CMD ["/usr/share/elasticsearch/import-data.sh"]
