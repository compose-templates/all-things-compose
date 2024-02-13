# What's new with Docker Compose?

## docker compose watch

```yaml
  webapp:
    build:        
      context: ./web
      dockerfile: Dockerfile
    develop:
      # 👋 it's a new feature
      # use `docker compose watch`
      watch:
        - action: rebuild
          path: web/public
    ports:
      - 7070:8080
      # open the webapp http://localhost:7070/
    depends_on:
      api:
        condition: service_started
```


speak about watch

```
docker compose watch
```

## Include

