import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PrismaModule } from './prisma/prisma.module';
import { EstudiantesModule } from './estudiantes/estudiantes.module';
import { CatalogosModule } from './catalogos/catalogos.module';
import { ObservacionesModule } from './observaciones/observaciones.module';
import { MatriculasModule } from './matriculas/matriculas.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    PrismaModule,
    EstudiantesModule,
    CatalogosModule,
    ObservacionesModule,
    MatriculasModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
