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

  findAllMembers(id: number) {
    return this.prisma.projects
      .findUniqueOrThrow({ where: { id } })
      .then((_res) =>
        this.prisma.member_projects.findMany({
          select: { member: true },
          where: { projects_id: id },
        }),
      )
      .then((res) => ({ data: res }))
      .catch((res) => new NotFoundException('Project does not exist.'));
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
