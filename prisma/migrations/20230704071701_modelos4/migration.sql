/*
  Warnings:

  - Added the required column `estudianteId` to the `Matriculas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Matriculas" ADD COLUMN     "estudianteId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Matriculas" ADD CONSTRAINT "Matriculas_estudianteId_fkey" FOREIGN KEY ("estudianteId") REFERENCES "Estudiantes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
