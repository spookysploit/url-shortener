# 🔗 URL Shortener

Простой и расширяемый сервис для сокращения URL, написанный на Go. Позволяет сохранять длинные ссылки и получать короткие, которые перенаправляют на оригинальные адреса.

---

## Используемые технологии

- **Язык:** Go 1.21+
- **HTTP:** net/http
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
