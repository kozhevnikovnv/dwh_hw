# App
HW1 DWH

### Что есть
Реализована репликация БД postgresql при помощи контейнеров postgres_master и postgres_slave. Написан скрипт для подсчета GMV, оформлен во view. 
Для запуска проекта: 
```
sh docker-init.sh
```
Как я проверял, что работает рекпликация:
```
docker exec -it postgres_master psql -h localhost -U postgres
```
Далее при помощи insert into заполнял поля таблиц, потом при помощи команды выше заходил в postgres_slave, и при помощи select * from ... смотрел, что данные реплицировались.
Также автоматически при исполнении скрипта docker-init.sh будет формироваться view для подсчета GMV, и результат будет выводиться в теримнал. Не уверен, что это используемая идея - но было интересно попробовать запустить)