import {
  HttpException,
  HttpStatus,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ProjectsService {
  constructor(private readonly prisma: PrismaService) {}

  async findAllMembers(id: number) {
    const project = await this.prisma.projects.findUnique({ where: { id } });
    if (project === null) {
      throw new NotFoundException('Project does not exist.');
    }

    const members = await this.prisma.member_projects.findMany({
      select: { member: true },
      where: { projects_id: id },
    });

    return { data: members };
  }
}
