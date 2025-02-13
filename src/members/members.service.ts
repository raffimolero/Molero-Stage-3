import { Injectable } from '@nestjs/common';
import { CreateMemberDto } from './dto/create-member.dto';
// import { UpdateMemberDto } from './dto/update-member.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MembersService {
  constructor(private readonly prisma: PrismaService) {}

  create(createMemberDto: CreateMemberDto) {
    return this.prisma.members.create({ data: createMemberDto });
  }

  // findAll() {
  //   return this.prisma.members.findMany();
  // }

  // findOne(id: number) {
  //   return this.prisma.members.findUnique({ where: { id } });
  // }

  // update(id: number, updateMemberDto: UpdateMemberDto) {
  //   return this.prisma.members.update({ where: { id }, data: updateMemberDto });
  // }

  // remove(id: number) {
  //   return this.prisma.members.delete({ where: { id } });
  // }
}
