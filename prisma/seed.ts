// prisma/seed.ts

import { PrismaClient } from '@prisma/client';

// initialize Prisma Client
const prisma = new PrismaClient();

const members = [
  ['Raffi Molero', 'backend'],
  ['John Doe', 'frontend'],
  ['Kyle Doe', 'UI/UX'],
  ['Steve Minecraft', 'frontend'],
  ['Mongo D. Bee', 'backend'],
  ['React Jay Es', 'frontend'],
  ['Notion Dot Sight', 'UI/UX'],
];

const projects = [
  [
    'Stage 1',
    "Stage 1 - Database Preparation with Migrations: In this stage, you'll set up the necessary database schema and create migrations to ensure smooth data updates and version control.",
  ],
  ['Stuff', 'A website that sells stuff'],
  [
    'Tropixotics',
    'A test website to showcase different ways to build frontend UI with PHP',
  ],
];

const member_projects = [
  [0, 0],
  [4, 0],
  [1, 1],
  [0, 1],
  [2, 1],
  [0, 2],
  [6, 2],
];

async function main() {
  const seeded: Record<string, any[]> = {};

  seeded.members = [];
  for (const [name, role] of members) {
    const item =
      (await prisma.members.findFirst({ where: { name } })) ??
      (await prisma.members.create({
        data: {
          name,
          role,
        },
      }));
    seeded.members.push(item);
  }

  seeded.projects = [];
  for (const [name, description] of projects) {
    const item =
      (await prisma.projects.findFirst({ where: { name } })) ??
      (await prisma.projects.create({
        data: {
          name,
          description,
        },
      }));
    seeded.projects.push(item);
  }

  seeded.member_projects = [];
  for (const [member_index, projects_index] of member_projects) {
    const member_id = seeded.members[member_index].id;
    const projects_id = seeded.projects[projects_index].id;
    const created = await prisma.member_projects.upsert({
      where: {
        member_id_projects_id: {
          member_id,
          projects_id,
        },
      },
      update: {},
      create: {
        member_id,
        projects_id,
      },
    });
    seeded.member_projects.push(created);
  }
  console.log(seeded);
}

// execute the main function
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    // close Prisma Client at the end
    await prisma.$disconnect();
  });
