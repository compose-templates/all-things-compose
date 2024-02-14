# Redis 1/2

## Create a Redis container with persistence

```bash
docker run -d -p 6379:6379 \
-e REDIS_ARGS="--save 30 1" \
-v ./data:/data \
redis:7.2.4
```

> - REDIS_ARGS: extra arguments for Redis
> - Redis automatically dumps the dataset to disk every 30 seconds if at least 1 key changed:
> - With `-v`, I define a volume to let Redis persist its data

### Let's have a look to the Docker Desktop GUI

- Enter the container
- Run `redis-cli`
- Add a (key, value) tuple: `set message "hello world"`
- Test it: `get message`
- Stop and drop the container
- Recreate one
- Run `redis-cli` again 
- Test it: `get message`
- Stop and drop the container again

# Redis 2/2

## Do it with Compose

> Converting the `docker run` command to a **"yaml Compose service"**

```yaml
services:
  redis-server:
    image: redis:7.2.4
    environment: 
      - REDIS_ARGS="--save 30 1"
      # or 
      # REDIS_ARGS: "--save 30 1"
    volumes:
    # define a volume to persist the data
      - ./data:/data
    ports:
      - 6379:6379
# host port -> container port
```

🚀 run `docker compose up`

### Let's have a look to the Docker Desktop GUI

- Enter the container
- Run `redis-cli`
- Test it: `get message`


