## Compose watch

```yaml
  webapp:
    build:        
      context: ./web
      dockerfile: Dockerfile
    # 👋 it's a new feature      
    develop:
      watch:
        - action: rebuild
          path: web/public
    # use `docker compose watch`
    ports:
      - 7070:8080
    depends_on:
      api:
        condition: service_started
```