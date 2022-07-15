## ДЗ №1 курса OTUS Microservice architect

1. ```
   Создать минимальный сервис, который отвечает на порту 8000, 
   имеет http-метод GET /health/ RESPONSE: {"status": "OK"}
   Собрать локально образ приложения в докер.
   Запушить образ в docker hub
   ```
    `make build && make push` собирает образ `eznd/otus-msa-hw1:latest` и пушит его в docker hub по тому же адресу

2. ```
   Написать манифесты для деплоя в k8s для этого сервиса. 
   Манифесты должны описывать сущности Deployment, Service, Ingress.
   В Deployment могут быть указаны Liveness, Readiness пробы.
   Количество реплик должно быть не меньше 2.
   Image контейнера должен быть указан с docker Hub.
   Хост в ингрессе должен быть arch.homework.
   В итоге, после применения манифестов GET запрос на http://arch.homework/health должен отдавать {“status”: “OK”}.
   ```
   
    `make k8s-apply` применяет манифесты

    При условии корректной настройки kubectl + /etc/hosts, по адресу http://arch.homework/health доступен хелсчек приложения 

    `make newman` запускает прогон коллекции Postman по всем адресам приложения
 
    `make k8s-delete` удаляет созданные сущности


 
