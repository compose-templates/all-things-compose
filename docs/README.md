
## Redis
> nice redis client: https://redis.tinycraft.cc/

Search the appropriate version with the GUI of Docker Desktop

```yaml
services:
  redis-server:
    image: redis:7.2.4
```
Add some data, stop, restart -> there is nothing
> By definition, a container is immutable


> persistence
```yaml
  redis-server:
    image: redis:7.2.4
    # Explain entrypoint (CMD)
    #entrypoint: ["redis-server", "--save", "30", "1", "--loglevel", "warning"]
    environment: 
      - REDIS_ARGS="--save 30 1 --loglevel warning"
    volumes:
      - ./data:/data

```

Add some data, wait , stop, restart -> 🎉

## Bulk loading
> https://redis.io/docs/manual/patterns/bulk-loading/

```yaml
  bulk-loading:
    image: redis:7.2.4
    entrypoint: ["/tasks/bulk_loading.sh", "yes"]
    volumes:
      - ./tasks:/tasks
    depends_on:
      redis-server:
        condition: service_started
```

Create a `tasks` directory with 2 files (`data.txt` and `bulk_loading.sh`)

> `data.txt`
```
SET first_name Philippe
SET x_handle @k33g_org
SET email philippe.charriere@docker.com
```

> `bulk_loading.sh`
```bash
#!/bin/bash
cat ../tasks/data.txt | redis-cli -h redis-server -p 6379 --pipe
```

Quit, re run `docker compose up`, go to the GUI and check the data

```
redis-cli
KEYS *
```

> `echo 'keys *' | redis-cli | sed 's/^/get /' | redis-cli` 

## Developer service

Fastify is a popular, efficient and low overhead Node.js web framework for building scalable and fast HTTP servers

- Create a `web` directory
- Create a `Dockerfile`
- search the appropriate node image