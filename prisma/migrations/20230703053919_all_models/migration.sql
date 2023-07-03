-- CreateTable
CREATE TABLE "Matriculas" (
    "id" SERIAL NOT NULL,
    "cursoId" INTEGER NOT NULL,
    "nota1" DECIMAL(65,30) NOT NULL,
    "nota2" DECIMAL(65,30) NOT NULL,
    "promedio" DECIMAL(65,30) NOT NULL,
    "porcentajeAsistencia" DECIMAL(65,30) NOT NULL,
    "estadoMatriculaId" INTEGER NOT NULL,
    "estadoCursoId" INTEGER NOT NULL,

    CONSTRAINT "Matriculas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Observaciones" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "completado" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "matriculaId" INTEGER NOT NULL,
    "asistenciaId" INTEGER NOT NULL,

    CONSTRAINT "Observaciones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FormularioInscripcion" (
    "id" SERIAL NOT NULL,
    "publicitado" BOOLEAN NOT NULL,
    "contactoInstitucion" TEXT NOT NULL,
    "otrosCursos" TEXT NOT NULL,
    "publicidadId" INTEGER NOT NULL,
    "matriculaId" INTEGER NOT NULL,

    CONSTRAINT "FormularioInscripcion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Documentos" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "urlArchivo" TEXT NOT NULL,
    "fechaSubida" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "formularioInscripcionId" INTEGER NOT NULL,

    CONSTRAINT "Documentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Asistencia" (
    "id" SERIAL NOT NULL,
    "periodo" TEXT NOT NULL,
    "cursoId" INTEGER NOT NULL,
    "evidenciaFotografica" TEXT NOT NULL,
    "duracionClase" TEXT NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "matriculaId" INTEGER NOT NULL,

    CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetalleAsistencia" (
    "id" SERIAL NOT NULL,
    "estadoAsistenciaId" INTEGER NOT NULL,

    CONSTRAINT "DetalleAsistencia_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "FormularioInscripcion_matriculaId_key" ON "FormularioInscripcion"("matriculaId");

-- AddForeignKey
ALTER TABLE "Matriculas" ADD CONSTRAINT "Matriculas_estadoMatriculaId_fkey" FOREIGN KEY ("estadoMatriculaId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matriculas" ADD CONSTRAINT "Matriculas_estadoCursoId_fkey" FOREIGN KEY ("estadoCursoId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observaciones" ADD CONSTRAINT "Observaciones_matriculaId_fkey" FOREIGN KEY ("matriculaId") REFERENCES "Matriculas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observaciones" ADD CONSTRAINT "Observaciones_asistenciaId_fkey" FOREIGN KEY ("asistenciaId") REFERENCES "Asistencia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormularioInscripcion" ADD CONSTRAINT "FormularioInscripcion_publicidadId_fkey" FOREIGN KEY ("publicidadId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormularioInscripcion" ADD CONSTRAINT "FormularioInscripcion_matriculaId_fkey" FOREIGN KEY ("matriculaId") REFERENCES "Matriculas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documentos" ADD CONSTRAINT "Documentos_formularioInscripcionId_fkey" FOREIGN KEY ("formularioInscripcionId") REFERENCES "FormularioInscripcion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asistencia" ADD CONSTRAINT "Asistencia_matriculaId_fkey" FOREIGN KEY ("matriculaId") REFERENCES "Matriculas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetalleAsistencia" ADD CONSTRAINT "DetalleAsistencia_estadoAsistenciaId_fkey" FOREIGN KEY ("estadoAsistenciaId") REFERENCES "Catalogo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
