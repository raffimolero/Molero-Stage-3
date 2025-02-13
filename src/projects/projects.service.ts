import {
  HttpException,
  HttpStatus,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateProjectDto } from './dto/create-project.dto';
import { UpdateProjectDto } from './dto/update-project.dto';
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

  // create(createProjectDto: CreateProjectDto) {
  //   return 'This action adds a new project';
  // }

  // findAll() {
  //   return `This action returns all projects`;
  // }

  // findOne(id: number) {
  //   return `This action returns a #${id} project`;
  // }

  // update(id: number, updateProjectDto: UpdateProjectDto) {
  //   return `This action updates a #${id} project`;
  // }

  // remove(id: number) {
  //   return `This action removes a #${id} project`;
  // }
}
