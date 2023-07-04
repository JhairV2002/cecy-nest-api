import { Catalogos } from 'src/estudiantes/estudiantesDTO';
import { MatriculaDto } from 'src/matriculas/MatriculaDto';

export interface detalleAsistenciaDto {
  id: number;
  estadoAsistencia: Catalogos;
  matriculas: MatriculaDto[];
}
