#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

docker compose exec db bash -c "pg_dump -c -U postgres ${DB_NAME} > /backups/db.sql"
