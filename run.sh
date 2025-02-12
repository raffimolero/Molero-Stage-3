#!/bin/bash
docker compose down
sleep 0.5s
docker compose build
docker compose up
docker compose down
