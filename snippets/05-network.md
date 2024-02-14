## Network

```yaml
services:
  redis-server:
    # ✋
    networks:
      - backend

  bulk-loading:
    # ✋
    networks:
      - backend

  api:
    # ✋
    networks:
      - backend
      - frontend

  webapp:
    # ✋
    networks:
      - frontend

networks:
  frontend:
  backend:

```
