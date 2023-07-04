import { Documentos } from '@prisma/client';

export interface documentosDto {
  id?: number;
  nombre: string;
  urlArchivo: string;
  fechaSubida?: Date | string;
}
