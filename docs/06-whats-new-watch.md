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


- Stop Docker Compose
- > Restart Compose
  ```
  docker compose watch
  ```
- Make a change in `web/template/index.ejs`
- Wait ⏳
- Refresh the browser


