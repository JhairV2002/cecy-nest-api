/*
  Warnings:

  - You are about to drop the column `description` on the `Observaciones` table. All the data in the column will be lost.
  - Added the required column `descripcion` to the `Observaciones` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Observaciones" DROP COLUMN "description",
ADD COLUMN     "descripcion" TEXT NOT NULL;
