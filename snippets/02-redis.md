```yaml
services:
  redis-server:
    image: redis:7.2.4
    environment: 
      - REDIS_ARGS="--save 30 1"
    volumes:
      - redis-data:/data
    ports:
      - 6379:6379

volumes:
  redis-data:
    external: true
    
```



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
```