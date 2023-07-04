/*
  Warnings:

  - You are about to drop the column `matriculaId` on the `Asistencia` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[descripcion]` on the table `Catalogo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `asistenciaId` to the `DetalleAsistencia` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Asistencia" DROP CONSTRAINT "Asistencia_matriculaId_fkey";

-- AlterTable
ALTER TABLE "Asistencia" DROP COLUMN "matriculaId",
ALTER COLUMN "cursoId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "DetalleAsistencia" ADD COLUMN     "asistenciaId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "FormularioInscripcion" ALTER COLUMN "contactoInstitucion" DROP NOT NULL;

-- CreateTable
CREATE TABLE "_DetalleAsistenciaToMatriculas" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_DetalleAsistenciaToMatriculas_AB_unique" ON "_DetalleAsistenciaToMatriculas"("A", "B");

-- CreateIndex
CREATE INDEX "_DetalleAsistenciaToMatriculas_B_index" ON "_DetalleAsistenciaToMatriculas"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Catalogo_descripcion_key" ON "Catalogo"("descripcion");

-- AddForeignKey
ALTER TABLE "DetalleAsistencia" ADD CONSTRAINT "DetalleAsistencia_asistenciaId_fkey" FOREIGN KEY ("asistenciaId") REFERENCES "Asistencia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DetalleAsistenciaToMatriculas" ADD CONSTRAINT "_DetalleAsistenciaToMatriculas_A_fkey" FOREIGN KEY ("A") REFERENCES "DetalleAsistencia"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DetalleAsistenciaToMatriculas" ADD CONSTRAINT "_DetalleAsistenciaToMatriculas_B_fkey" FOREIGN KEY ("B") REFERENCES "Matriculas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
