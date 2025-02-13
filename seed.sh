#!/bin/bash
source .env
docker compose down
docker compose up db -d
sleep 0.5s

echo "Note: The first generate command throws an error on my machine. It will execute twice."
npx prisma generate # for some reason this one gets its permissions denied
echo "Note: The following operation takes about 7 seconds on my machine. It does not have a loading bar or icon or anything."
npx prisma generate
npx prisma migrate deploy
npx prisma db seed

docker compose down