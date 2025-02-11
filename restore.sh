#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

npx prisma migrate deploy
docker compose exec db bash -c "psql -U postgres -d ${DB_NAME} -f /backups/db.sql"

docker compose down