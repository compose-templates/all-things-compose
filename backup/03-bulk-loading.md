```yaml
  bulk-loading:
    image: redis:7.2.4
    entrypoint: ["/load-data/bulk_loading.sh"]
    volumes:
      - ./load-data:/load-data
    depends_on:
      redis-server:
        condition: service_started
```
