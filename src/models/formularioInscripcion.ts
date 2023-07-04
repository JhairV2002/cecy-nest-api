import { Catalogos } from 'src/estudiantes/estudiantesDTO';
import { documentosDto } from './documentosDto';

export interface formularioInscripcionDto {
  publicitado: boolean;
  contactoInstitucion: string;
  otrosCursos: string;
  publicidad: Catalogos;
  documentos?: documentosDto[];
}
