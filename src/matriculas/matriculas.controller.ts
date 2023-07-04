import { Body, Controller, Get, Post } from '@nestjs/common';
import { MatriculasService } from './matriculas.service';
import { Matriculas } from '@prisma/client';
import { MatriculaDto } from './MatriculaDto';

@Controller('matriculas')
export class MatriculasController {
  constructor(private matriculasService: MatriculasService) {}
  @Get('all')
  findAllMatriculas() {
    return this.matriculasService.publicFindAllMatriculas();
  }

  @Post('create')
  /**
   * saveMatriculas
   */
  public async saveMatriculas(@Body() data: MatriculaDto) {
    const nestedData = {
      ...data,
      estadoMatricula: { connect: { id: data.estadoMatricula.id } },
      estadoCurso: { connect: { id: data.estadoCurso.id } },
      formularioInscripcion: {
        create: {
          ...data.formularioInscripcion,
          publicidad: {
            connect: { id: data.formularioInscripcion.publicidad.id },
          },
          documentos: {
            createMany: {
              data: data.formularioInscripcion.documentos,
            },
          },
        },
      },
      estudiante: {
        connect: { id: data.estudiante.id },
      },
      observaciones: {
        createMany: {
          data: data.observaciones ? data.observaciones : [],
        },
      },
    };
    return await this.matriculasService.createMatriculas(nestedData);
  }
}
