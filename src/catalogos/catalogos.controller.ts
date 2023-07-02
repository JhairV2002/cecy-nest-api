import { Body, Controller, Get, Post } from '@nestjs/common';
import { CatalogosService } from './catalogos.service';
import { Prisma } from '@prisma/client';

@Controller('catalogos')
export class CatalogosController {
  constructor(private catalogosService: CatalogosService) {}

  @Get('all')
  async findAllCatalogos() {
    return await this.catalogosService.findAllCatalogo();
  }

  @Post('create')
  async saveCatalogos(@Body() data: Prisma.CatalogoCreateInput) {
    return await this.catalogosService.saveCatalogo(data);
  }
}
