import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from 'generated/prisma_client';

@Injectable()
export class MembersService {
  constructor(private readonly prisma: PrismaService) {}

  create(createMemberDto: Prisma.membersCreateInput) {
    return this.prisma.members.create({ data: createMemberDto });
  }

  // findAll() {
  //   return this.prisma.members.findMany();
  // }

  // findOne(id: number) {
  //   return this.prisma.members.findUnique({ where: { id } });
  // }

  // update(id: number, updateMemberDto: Prisma.membersUpdateInput) {
  //   return this.prisma.members.update({ where: { id }, data: updateMemberDto });
  // }

  // remove(id: number) {
  //   return this.prisma.members.delete({ where: { id } });
  // }
}
