import { Module } from '@nestjs/common';
import { MatriculasService } from './matriculas.service';
import { MatriculasController } from './matriculas.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  providers: [MatriculasService],
  imports: [PrismaModule],
  controllers: [MatriculasController],
})
export class MatriculasModule { }
