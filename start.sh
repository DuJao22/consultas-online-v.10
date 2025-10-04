#!/bin/bash

echo "Iniciando MedConnect..."

python3 -c "from app import init_db; init_db()"

PORT=${PORT:-5000}

exec gunicorn --worker-class gthread --workers 1 --threads 100 --bind 0.0.0.0:$PORT --timeout 300 --log-level info --access-logfile - --error-logfile - app:app
