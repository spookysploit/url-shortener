# 🔗 URL Shortener

A simple and extensible URL shortening service written in Go. Allows you to save long links and get short links that redirect to the original addresses.

---

## Technologies used

- **Language:** Go 1.21+
- **Router:** chi
- **DBMS:** PostgreSQL
- **Configuration:** YAML (`config/local.yaml`)
- **Logging:** slog
- **Containerization:** Docker, Docker Compose
- **Testing:** Go `testing`, `testify/mock`

---

## Launching in Docker
Download repository using command:
```
git clone https://github.com/spookysploit/url-shortener.git
```
Open the repository:
```
cd ./url-shortener
```
Lauch command:
```
docker compose up --build
```
After that, service will be available at:\
__http://localhost:8080/__

---

## Usage
To shorten the link use command:
```
curl -X POST -d '{"url": "https://example.com/", "alias":"example"}' http://my_user:my_password@localhost:8080/url
```
Right command output:
```
{"status":"OK","alias":"example"}
```
The shortened link will look like:
```
http://localhost:8080/example
```
If a link with such alias already exists, the response will contain an error.:
```
{"status":"Error","error":"url already exists"}
```
When using the shortened link, we get:
```
curl http://localhost:8080/example
```
```
<a href="https://example.com/">Found</a>.
```
