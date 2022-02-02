#!/bin/sh

# postgres container name: postgres
# redis container name: redis

# orchestrator settings
export DATABASE_URI=postgresql://$APP_DB_USER:$APP_DB_PASS@$APP_DB_HOSTNAME/$APP_DB_NAME
export CACHE_HOST=redis
export WEBSOCKET_BROADCASTER_URL=redis://nobody:$REDIS_PASSWORD@$REDIS_HOSTNAME:6379


python3 core.py db init
python3 core.py db upgrade heads
PYTHONPATH=/ uvicorn --reload --host 0.0.0.0 --port $CORE_LOCAL_PORT core:app