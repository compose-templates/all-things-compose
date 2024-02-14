
## API

```yaml
  api:
    build:        
      context: ./api
      dockerfile: Dockerfile
    environment:
      - FRONT_URL=http://localhost:7070
      # to allow the front to connect to the API (CORS, Cross-Origin Resource Sharing)
    ports:
      - 6060:8080
      # query the API on http://localhost:6060/counter
    depends_on:
      redis-server:
        condition: service_started
```

## FrontEnd

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