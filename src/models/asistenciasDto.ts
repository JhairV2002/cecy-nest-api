import { detalleAsistenciaDto } from './detalleAsistenciaDto';
import { ObservacionesDto } from './observacionesDto';

export interface asistenciasDto {
  id: number;
  periodo: string;
  cursoId?: number;
  evidenciaFotografica: string;
  duracionCalse: string;
  fecha: string;
  observaciones?: ObservacionesDto[];
  detalleAsistencia: detalleAsistenciaDto[];
}
