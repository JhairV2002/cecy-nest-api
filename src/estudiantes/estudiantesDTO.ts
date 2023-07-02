export interface EstudiantesDTO {
  id: number;
  cedula: string;
  clave: string;
  fechaNacimiento: string | Date;
  nombres: string;
  apellidos: string;
  email: string;
  discapacidad: boolean;
  detallesDiscapacidad: string;
  direccion: string;
  numeroCelular: string;
  numeroConvencional: string;
  genero: Catalogos;
  tipoEstudiante: Catalogos;
  etnia: Catalogos;
  nivelInstruccion: Catalogos;
  situacionEconomica: Catalogos;
}

export interface Catalogos {
  id: number;
  nombre: string;
  descripcion: string;
}
