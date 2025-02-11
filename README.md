# Molero-Stage-1

Stage 1 of the SAMAHAN SysDev technical assessment.

# About the project:

- To be run in WSL 2 on Windows, or simply used in a Linux machine
- Backend JS framework: Nest.js
- Database: PostgreSQL (with pgAdmin)
- Orchestrated with Docker
- Works on my machine

# How to run:

If you're on Windows, you must use WSL and start up Docker Desktop,
otherwise it will complain that "Docker" can't be found on this machine.

- WSL: https://learn.microsoft.com/en-us/windows/wsl/install
- Docker desktop: https://docs.docker.com/desktop/setup/install/windows-install/

Simply run this command to enter the WSL terminal,

```bat
wsl
```

Then run the following lines (preferably one by one) to clone the repository and run the server.

```sh
git clone https://github.com/raffimolero/Molero-Stage-1.git
cd Molero-Stage-1.git
# of course, you should check ./run.sh before running this script.
chmod +x ./run.sh
./run.sh
```

After the docker engine runs, you should be able to access the api through http://localhost:3000/

# Other Notes:

- nestjs is in localhost:3000/
- pgadmin is in localhost:5050/
  - username is admin@admin.com
  - password is pgadmin4
- postgresql is in localhost:5432/

# How it was made:

- nest new api
- push to github
- remove .env from .gitignore for demo purposes
- pull out docker-compose, Dockerefile, run.sh, and .gitattributes from inventory
- install extra modules that don't come by default somehow

```sh
npm i --save @nestjs/mapped-types @nestjs/common @nestjs/core
```

- install prisma by attempting to invoke it

```sh
npx prisma init
```

- modify DATABASE_URL in .env to have the correct username password and hostname
  - username: pgname
  - password: pgpass
  - hostname: db (defined in docker-compose.yml)
  - database: sysdev_management (as instructed)
