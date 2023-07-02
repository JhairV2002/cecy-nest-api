import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

import { Estudiantes } from '@prisma/client';
import { EstudiantesDTO } from './estudiantesDTO';

@Injectable()
export class EstudiantesService {
  constructor(private prismaService: PrismaService) {}

  /**
   * findAllEstudiantes
   */
  public async findAllEstudiantes() {
    return await this.prismaService.estudiantes.findMany({
      include: {
        genero: true,
        etnia: true,
        tipoEstudiante: true,
        nivelInstruccion: true,
        situacionEconomica: true,
      },
    });
  }

  public async saveEstudiantes(data: Prisma.EstudiantesCreateInput) {
    return await this.prismaService.estudiantes.create({
      data,
      include: {
        situacionEconomica: true,
        nivelInstruccion: true,
        etnia: true,
        tipoEstudiante: true,
        genero: true,
      },
    });
  }
}
