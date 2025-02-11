#!/bin/bash

# Line required because the postgres database files cannot be accessed through WSL sometimes
# possibly because it was created by Windows' Docker Desktop, which is not the linux user
# this simply takes ownership of all the files within the current directory.
sudo chown -R $USER:$USER .

# This script automatically builds and runs the applications through docker,
docker compose build
docker compose up -d
# then puts the user into an interactive terminal session with the nestjs server.
docker compose exec -it app bash
# It then automatically shuts them down once the user exits the interactive terminal.
docker compose down -v
