/*
  Warnings:

  - Made the column `updated_at` on table `members` required. This step will fail if there are existing NULL values in that column.
  - Made the column `updated_at` on table `projects` required. This step will fail if there are existing NULL values in that column.

*/
UPDATE members SET updated_at = CURRENT_TIMESTAMP;
UPDATE projects SET updated_at = CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "member_projects" ALTER COLUMN "assigned_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "members" ALTER COLUMN "updated_at" SET NOT NULL;

-- AlterTable
ALTER TABLE "projects" ALTER COLUMN "updated_at" SET NOT NULL;
