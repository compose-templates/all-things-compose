# API

Present the API source code + the Docker file


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

Stop and restart compose

> get counters
```bash
curl http://localhost:6060/counter/panda
curl http://localhost:6060/counter/fox
curl http://localhost:6060/counter/hamster
curl http://localhost:6060/counter/tiger
```

> set counter(s)
```bash
curl http://localhost:6060/counter -d '{"animal": "panda"}' -H "Content-Type: application/json"
```

