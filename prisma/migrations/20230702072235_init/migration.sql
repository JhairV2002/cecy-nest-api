-- CreateEnum
CREATE TYPE "Roles" AS ENUM ('ESTUDIANTE', 'ADMIN');

-- CreateTable
CREATE TABLE "Catalogo" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "Catalogo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Estudiantes" (
    "id" SERIAL NOT NULL,
    "cedula" TEXT NOT NULL,
    "fechaNacimiento" TIMESTAMP(3) NOT NULL,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "discapacidad" BOOLEAN NOT NULL DEFAULT false,
    "detallesDiscapacidad" TEXT,
    "direccion" TEXT NOT NULL,
    "numeroCelular" TEXT NOT NULL,
    "numeroConvencional" TEXT NOT NULL,
    "clave" TEXT NOT NULL,
    "rol" "Roles" NOT NULL DEFAULT 'ESTUDIANTE',
    "generoId" INTEGER NOT NULL,
    "tipoEstudianteId" INTEGER NOT NULL,
    "etniaId" INTEGER NOT NULL,
    "nivelInstruccionId" INTEGER NOT NULL,
    "situacionEconomicaId" INTEGER NOT NULL,

    CONSTRAINT "Estudiantes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Estudiantes_email_key" ON "Estudiantes"("email");

-- AddForeignKey
ALTER TABLE "Estudiantes" ADD CONSTRAINT "Estudiantes_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiantes" ADD CONSTRAINT "Estudiantes_tipoEstudianteId_fkey" FOREIGN KEY ("tipoEstudianteId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiantes" ADD CONSTRAINT "Estudiantes_etniaId_fkey" FOREIGN KEY ("etniaId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiantes" ADD CONSTRAINT "Estudiantes_nivelInstruccionId_fkey" FOREIGN KEY ("nivelInstruccionId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Estudiantes" ADD CONSTRAINT "Estudiantes_situacionEconomicaId_fkey" FOREIGN KEY ("situacionEconomicaId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
