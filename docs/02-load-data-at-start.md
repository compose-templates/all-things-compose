# Load data to redis

✋ Stop Docker Compose

## We need to load data when the Redis container is started

### Create a new service

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
> - ✋ entrypoint: The **entrypoint** instruction is used to configure the executables that will always run after the container is initiated. For example, in this case, I specified a script (`bulk_loading`) to run as soon as the container is started.
> - ✋ thanks to the `depends_on` instruction, I explain that the **bulk-loading** service will start only when the **redis-server** service will be started.

### Create a directory and files to load the data

```bash
mkdir load-data
cd load-data
touch bulk_loading.sh
chmod +x bulk_loading.sh
```

> `bulk_loading.sh`
```bash
#!/bin/bash
cat /load-data/data.txt | redis-cli -h redis-server -p 6379 --pipe 
```

> `data.txt`
```text
SET hamster 12
SET panda 12
SET tiger 68
SET fox 20
```

### Restart the Compose project

🚀 run `docker compose up`

### Let's have a look to the Docker Desktop GUI

- Enter the container
- Run `redis-cli`
- Test it: `keys *` then `get panda`


