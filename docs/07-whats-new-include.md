# What's new with Docker Compose?

## Include


```bash
touch redis-server.yaml
touch bulk-loading.yaml
```

> redis-server.yaml
```yaml
services:
  redis-server:
    image: redis:7.2.4
    environment: 
      - REDIS_ARGS="--save 30 1"
    volumes:
      - ./data:/data
    ports:
      - 6379:6379
    networks:
      - backend
```

> bulk-loading.yaml
```yaml
services:  
  bulk-loading:
    image: redis:7.2.4
    entrypoint: ["/load-data/bulk_loading.sh"]
    volumes:
      - ./load-data:/load-data
    depends_on:
      redis-server:
        condition: service_started
    networks:
      - backend
```

> compose.yaml
```yaml
include:
  - redis-server.yaml
  - bulk-loading.yaml
```