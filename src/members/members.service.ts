import { Injectable } from '@nestjs/common';
import { CreateMembersDto } from 'generated/nestjs-dto/create-members.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MembersService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createMemberDto: CreateMembersDto) {
    const member = await this.prisma.members.create({ data: createMemberDto });
    return {
      message: 'Member added successfully.',
      data: member,
    };
  }
}
