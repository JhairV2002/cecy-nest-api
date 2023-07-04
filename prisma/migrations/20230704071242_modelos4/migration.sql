-- DropForeignKey
ALTER TABLE "Observaciones" DROP CONSTRAINT "Observaciones_asistenciaId_fkey";

-- DropForeignKey
ALTER TABLE "Observaciones" DROP CONSTRAINT "Observaciones_matriculaId_fkey";

-- AlterTable
ALTER TABLE "Observaciones" ALTER COLUMN "matriculaId" DROP NOT NULL,
ALTER COLUMN "asistenciaId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Observaciones" ADD CONSTRAINT "Observaciones_matriculaId_fkey" FOREIGN KEY ("matriculaId") REFERENCES "Matriculas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observaciones" ADD CONSTRAINT "Observaciones_asistenciaId_fkey" FOREIGN KEY ("asistenciaId") REFERENCES "Asistencia"("id") ON DELETE SET NULL ON UPDATE CASCADE;
