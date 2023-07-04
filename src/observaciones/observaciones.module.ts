import { Module } from '@nestjs/common';
import { ObservacionesService } from './observaciones.service';
import { ObservacionesController } from './observaciones.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  providers: [ObservacionesService],
  imports: [PrismaModule],
  controllers: [ObservacionesController],
})
export class ObservacionesModule { }
