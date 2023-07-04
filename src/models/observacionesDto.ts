export interface ObservacionesDto {
  id?: number;
  descripcion: string;
  completado?: boolean;
  createdAt?: Date | string;
  updatedAt?: Date | string;
  asistenciaId?: number;
}
