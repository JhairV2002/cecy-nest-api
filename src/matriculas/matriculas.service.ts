import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MatriculasService {
  constructor(private prismaService: PrismaService) {}

  async publicFindAllMatriculas() {
    return await this.prismaService.matriculas.findMany();
  }

  async createMatriculas(data: Prisma.MatriculasCreateInput) {
    return await this.prismaService.matriculas.create({
      data,
      include: {
        estadoMatricula: true,
        estadoCurso: true,
        observaciones: true,
        formularioInscripcion: {
          include: {
            documentos: true,
            publicidad: true,
          },
        },
      },
    });
  }
}
