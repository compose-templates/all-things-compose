
```yaml
    # ✋ redis-server
    networks:
      - backend

  ## API
  api:
    build:        
      context: ./api
      dockerfile: api.Dockerfile
    environment:
      - FRONT_URL=http://localhost:7070
      # to allow the front to connect to the API (CORS, Cross-Origin Resource Sharing)
    ports:
      - 6060:8080
      # query the API on http://localhost:6060/counter
    depends_on:
      redis-server:
        condition: service_started
    networks:
      - backend
      - frontend


  ## FrontEnd
  webapp:
    build:        
      context: ./web
      dockerfile: web.Dockerfile
    environment:
      - API_URL=http://localhost:6060
    ports:
      - 7070:8080
    # open the webapp http://localhost:7070/
    depends_on:
      api:
        condition: service_started
    networks:
      - frontend

networks:
  frontend:
  backend:
```