# Этап 1: Сборка приложения
FROM golang:1.24.3 AS builder

WORKDIR /app

# Копируем go.mod и go.sum для кэширования зависимостей
COPY go.mod go.sum ./
RUN go mod download

# Копируем весь код проекта
COPY . .

# Компилируем приложение
RUN CGO_ENABLED=0 GOOS=linux go build -o url-shortener ./cmd/url-shortener/main.go

# Этап 2: Финальный образ
FROM alpine:latest

WORKDIR /app

# Устанавливаем зависимости и wait-for-it
RUN apk --no-cache add ca-certificates bash curl \
    && curl -sL https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > wait-for-it.sh \
    && chmod +x wait-for-it.sh

# Копируем скомпилированный бинарник из этапа сборки
COPY --from=builder /app/url-shortener .

# Копируем конфигурацию
COPY config/local.yaml ./config/local.yaml

# Указываем порт, который будет использовать приложение
EXPOSE 8080

# Команда для запуска приложения с ожиданием базы
CMD ["./wait-for-it.sh", "postgres:5432", "--", "./url-shortener"]