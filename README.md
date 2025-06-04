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

## 🐳 Запуск в Docker
docker compose up --build
Приложение будет доступно по адресу:
http://localhost:8080


<details> <summary>💡 Пример команды для `ffuf`</summary>
bash
Копировать
Редактировать
ffuf -w /path/to/vhost/wordlist -u https://target -H "Host: FUZZ" -fs 4242
</details>
