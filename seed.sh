#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

npx prisma generate # for some reason this one gets its permissions denied
npx prisma generate
npx prisma migrate deploy
npx prisma db seed

docker compose down