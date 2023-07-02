import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CatalogosService {
  constructor(private prismaService: PrismaService) { }

  public async saveCatalogo(data: Prisma.CatalogoCreateInput) {
    return await this.prismaService.catalogo.create({
      data,
    });
  }

  /**
   * name
   */
  public async findAllCatalogo() {
    return await this.prismaService.catalogo.findMany();
  }
}
