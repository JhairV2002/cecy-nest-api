import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ObservacionesService {
  constructor(private prismaService: PrismaService) { }

  public async findAllObsercaciones() {
    return await this.prismaService.observaciones.findMany({});
  }
}
