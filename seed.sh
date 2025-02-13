#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

npx prisma generate
npx prisma migrate deploy
npx prisma db seed

docker compose down