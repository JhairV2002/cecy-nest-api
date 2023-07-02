import { Body, Controller, Get, Post } from '@nestjs/common';
import { Estudiantes, Prisma } from '@prisma/client';
import { EstudiantesService } from './estudiantes.service';
import { EstudiantesDTO } from './estudiantesDTO';

@Controller('estudiantes')
export class EstudiantesController {
  constructor(private estudiantesService: EstudiantesService) {}

  @Get('all')
  public async findAllEstudiantes() {
    return await this.estudiantesService.findAllEstudiantes();
  }

  @Post('create')
  public async saveEstudiantes(@Body() data: EstudiantesDTO) {
    data.fechaNacimiento = new Date(data.fechaNacimiento);
    const nestedData = {
      ...data,
      genero: { connect: { id: data.genero.id } },
      tipoEstudiante: { connect: { id: data.tipoEstudiante.id } },
      etnia: { connect: { id: data.etnia.id } },
      nivelInstruccion: { connect: { id: data.etnia.id } },
      situacionEconomica: { connect: { id: data.situacionEconomica.id } },
    };
    return await this.estudiantesService.saveEstudiantes(nestedData);
  }
}
