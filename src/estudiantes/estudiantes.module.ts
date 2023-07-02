import { Module } from '@nestjs/common';
import { EstudiantesService } from './estudiantes.service';
import { PrismaModule } from 'src/prisma/prisma.module';
import { EstudiantesController } from './estudiantes.controller';

@Module({
  providers: [EstudiantesService],
  imports: [PrismaModule],
  controllers: [EstudiantesController],
})
export class EstudiantesModule {}
