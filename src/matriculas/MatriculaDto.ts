import { Catalogos, EstudiantesDTO } from 'src/estudiantes/estudiantesDTO';
import { formularioInscripcionDto } from 'src/models/formularioInscripcion';
import { ObservacionesDto } from 'src/models/observacionesDto';

export interface MatriculaDto {
  id?: number;
  cursoId: number;
  nota1?: number;
  nota2?: number;
  promedio?: number;
  porcentajeAsistencia?: number;
  estadoMatricula: Catalogos;
  estadoCurso: Catalogos;
  formularioInscripcion: formularioInscripcionDto;
  observaciones?: ObservacionesDto[];
  estudiante: EstudiantesDTO;
}
