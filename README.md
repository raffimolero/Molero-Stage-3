# Molero-Stage-2

Stage 2 of the SAMAHAN SysDev technical assessment.

# About the project:

- To be run in WSL 2 on Windows, or simply used in a Linux machine
- Backend JS framework: Nest.js
- Database: PostgreSQL (with pgAdmin)
- Orchestrated with Docker
- Works on my machine

I don't know how to set up MySQL as of the moment.

# How to run:

If you're on Windows, you must use WSL and start up Docker Desktop,
otherwise it will complain that "Docker" can't be found on this machine.

- WSL: https://learn.microsoft.com/en-us/windows/wsl/install
- Docker desktop: https://docs.docker.com/desktop/setup/install/windows-install/

Simply run this command to enter the WSL terminal,

```bat
wsl
```

Then run the following lines to clone and set up the repository.

```sh
git clone https://github.com/raffimolero/Molero-Stage-2.git
cd Molero-Stage-2
chmod +x ./*.sh
./seed.sh
```

Then run the server.

```
./run.sh
```

After the docker engine runs, you should be able to access the api through http://localhost:3000/

pgAdmin is also available through http://localhost:5050/ (note that pgadmin takes a whole 10-20s after nestjs to start up on my machine)

- I followed this tutorial so refer to it when using pgAdmin https://dev.to/chukwutosin_/step-by-step-guide-setting-up-a-nestjs-application-with-docker-and-postgresql-5hei
- Should look something like this when setting up:
  - ![img](docs/pgadmin/1_login.png)
  - ![img](docs/pgadmin/2_addserver.png)
  - server name can be anything, not necessarily `asdf`
  - ![img](docs/pgadmin/2_addserver/2-1_general.png)
  - ![img](docs/pgadmin/2_addserver/2-2_connection.png)
  - ![img](docs/pgadmin/3_tables.png)
  - ![img](docs/pgadmin/4_query.png)
  - ![img](docs/pgadmin/4_query/4-1_select_tables.png)
  - ![img](docs/pgadmin/4_query/4-2_insert.png)

# Sample SQL

```sql
SELECT * FROM members;
SELECT * FROM projects;
SELECT * FROM member_projects;

TRUNCATE TABLE members CASCADE;
TRUNCATE TABLE projects CASCADE;
TRUNCATE TABLE member_projects CASCADE;

SELECT *
FROM member_projects
INNER JOIN members ON member_projects.member_id = members.id
INNER JOIN projects ON member_projects.projects_id = projects.id;
```

# Other Notes:

- nestjs is in localhost:3000/
- pgadmin is in localhost:5050/
  - username is admin@admin.com
  - password is pgadmin4
- postgresql is in localhost:5432/

# Learning Resources:

- YouTube NestJS + Prisma tutorial: https://www.youtube.com/watch?v=8_X0nSrzrCw
  - i stopped as he set up the SQL database
- NestJS + PostgreSQL + Docker: https://dev.to/chukwutosin_/step-by-step-guide-setting-up-a-nestjs-application-with-docker-and-postgresql-5hei
  - i used Prisma in place of TypeORM
- NestJS + Prisma REST API: https://www.prisma.io/blog/nestjs-prisma-rest-api-7D056s1BmOL0

# How it was made:

This section supplements the Git history by explaining what commands were run when.

This can also be used as a sort of reviewer/notebook for building more applications like this.

## Stage 1:

- nest new api
- push to github
- remove .env from .gitignore for demo purposes
- pull out docker-compose, Dockerefile, \*.sh, .dockerignore, and .gitattributes from inventory
- install extra modules that don't come by default somehow

```sh
npm i --save @nestjs/mapped-types @nestjs/common @nestjs/core
```

- install prisma by attempting to invoke it

```sh
npx prisma init
```

- modify DATABASE_URL in .env to have the correct username password and hostname

  - username: postgres
  - password: postgres
  - hostname: db (defined in docker-compose.yml)
  - database: sysdev_management (as instructed)

- encode the schema for members, projects, and member_projects in prisma/schema.prisma
- migrate

```sh
docker compose up -d
npx prisma migrate dev --name init
```

- open pgAdmin and sign in
- connect to the postgres server
- right click sysdev_management and open query tool
- insert some members
- insert some projects
- insert some member/project pairings
- run `./backup.sh`
- realize that there is a separate db seed command
- create prisma/seed.ts
- modify package.json

```json
  "prisma": {
    "seed": "ts-node prisma/seed.ts"
  }
```

- truncate db to clear most data
- run seed command

```sh
npx prisma db seed
```

- repeat previous 2 steps but for partially cleared/filled data to test
- push and call stage 1 done

## Stage 2:

- create new github repository -> import repository -> enter stage 1 url (cannot directly fork your own repository)
- fix all relevant mentions of stage 1
- rerun provided clone/seed script
- create prisma database service

```sh
nest generate module prisma
nest generate service prisma
```

- PrismaService extends PrismaClient (imported from generated/prisma_client)
  - implements OnModuleInit
- add PrismaModule `exports: [PrismaService],`
- swagger

```sh
npm install --save @nestjs/swagger swagger-ui-express
```

- build swagger docs in main.ts
- create crud endpoints for members

```sh
nest generate resource
# name: members
# transport layer: REST
# crud: yes
```

- replace generated DTOs with the Prisma inputs
- delete all traces of the autogenerated DTOs
- create constructor for MembersService to connect to Prisma db
- attach all relevant DB operations to prisma
- improve members create endpoint (as instructed)
- disable all other endpoints, but keep them for reference
- do the same for projects get endpoint (find all members associated with a project, as instructed)
- return a 404 if project does not exist
- push and call stage 2 done

## Stage 3:

- read about validation with prisma+nestjs+swagger https://www.npmjs.com/package/@brakebein/prisma-generator-nestjs-dto
- install it alongside class-validator

```sh
npm install --save class-validator class-transformer
npm install --save-dev @brakebein/prisma-generator-nestjs-dto
```

- add dto generator to schema.prisma
