# 🔗 URL Shortener

Простой и расширяемый сервис для сокращения URL, написанный на Go. Позволяет сохранять длинные ссылки и получать короткие, которые перенаправляют на оригинальные адреса.

---

## Используемые технологии

- **Язык:** Go 1.21+
- **Роутер:** chi
- **База данных:** PostgreSQL
- **Конфигурация:** YAML (`config/local.yaml`)
- **Логирование:** slog
- **Контейнеризация:** Docker, Docker Compose
- **Тестирование:** Go `testing`, `testify/mock`

---

## Запуск в Docker
Скачайте репозиторий используя команду:
```
git clone https://github.com/spookysploit/url-shortener.git
```
Перейдите в репозиторий:
```
cd ./url-shortener
```
Запустите командой:
```
docker compose up --build
```
После чего сервис будет доступен по адресу:
__http://localhost:8080/__

---

## Использование
Для того чтобы сократить ссылку используйте команду:
```
curl -X POST -d '{"url": "https://example.com/", "alias":"example"}' http://my_user:my_password@localhost:8080/url
```
Правильный вывод команды:
```
{"status":"OK","alias":"example"}
```
Сокращенная ссылка будет выглядеть так:
```
http://localhost:8080/example
```
Если ссылка с таким алиасом уже существует то в ответе будет ошибка:
```
{"status":"Error","error":"url already exists"}
```
При переходе по сокращенной ссылке получаем:
```
curl http://localhost:8080/example
```
```
<a href="https://example.com/">Found</a>.
```
