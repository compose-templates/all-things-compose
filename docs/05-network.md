# Networking

- Each Compose stack gets its own network
- Each service has a DNS entry added that matches its **name**
- This allows the **api** service to connect to the **redis-server** service simply using the hostname **redis-server**

run `node index.mjs` from the webapp container

I don't want the webapp could join directly the `redis-server` service

Add this to `redis-server` and `bulk-loading`
```yaml
    networks:
      - backend
```

Add this to `api`
```yaml
    networks:
      - backend
      - frontend
```

Add this to `webapp`
```yaml
    networks:
      - frontend
```

At the bottom of the yaml file

```yaml
networks:
  frontend:
  backend:

```

restart `docker compose up`

run again `node index.mjs` from the webapp container, 🎉

