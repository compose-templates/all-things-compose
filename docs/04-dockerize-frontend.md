

```yaml
  webapp:
    build:        
      context: ./web
      dockerfile: Dockerfile
    environment:
      - API_URL=http://localhost:6060
    ports:
      - 7070:8080
    # open the webapp http://localhost:7070/
    depends_on:
      api:
        condition: service_started
```


