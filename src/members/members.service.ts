import { Injectable } from '@nestjs/common';
import { CreateMemberDto } from './dto/create-member.dto';
// import { UpdateMemberDto } from './dto/update-member.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MembersService {
  constructor(private readonly prisma: PrismaService) {}

  /*
    NOTE: for better error messages and swagger api, look into prisma-generator-class-validator and have that generate the DTOs
    generator classValidator {
      provider = "prisma-generator-class-validator"
      output   = "./generated/validators"
    }
  */
  async create(createMemberDto: CreateMemberDto) {
    const member = await this.prisma.members.create({ data: createMemberDto });
    return {
      message: 'Member added successfully.',
      data: member,
    };
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
