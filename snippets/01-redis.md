## Create a container from the Redis Image

```bash
docker volume create redis-data
docker volume ls

docker run -d -p 6379:6379 \
-e REDIS_ARGS="--save 30 1" \
-v redis-data:/data \
redis:7.2.4
```

## Add data to the Redis database
> redis-cli
```bash
SET hamster 12
SET panda 12
SET tiger 68
SET fox 20
```


## Create a container from the Redis Image

```bash
docker run -d -p 6379:6379 \
-e REDIS_ARGS="--save 30 1" \
-v ./data:/data \
redis:7.2.4
```

