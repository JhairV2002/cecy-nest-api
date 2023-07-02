import { Module } from '@nestjs/common';
import { CatalogosService } from './catalogos.service';
import { PrismaModule } from 'src/prisma/prisma.module';
import { CatalogosController } from './catalogos.controller';

@Module({
  providers: [CatalogosService],
  imports: [PrismaModule],
  controllers: [CatalogosController],
})
export class CatalogosModule {}
