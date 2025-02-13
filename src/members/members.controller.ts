import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { MembersService } from './members.service';
import { Prisma } from 'generated/prisma_client';

@Controller('members')
export class MembersController {
  constructor(private readonly membersService: MembersService) {}

  /*
    NOTE: for better error messages, look into prisma-generator-class-validator and have that generate the DTOs
    generator classValidator {
      provider = "prisma-generator-class-validator"
      output   = "./generated/validators"
    }
  */

  @Post()
  create(@Body() createMemberDto: Prisma.membersCreateInput) {
    return this.membersService
      .create(createMemberDto)
      .then((res) => ({
        message: 'Member added successfully.',
        data: res,
      }))
      .catch((err) => err);
  }

  // @Get()
  // findAll() {
  //   return this.membersService.findAll();
  // }

  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.membersService.findOne(+id);
  // }

  // @Patch(':id')
  // update(
  //   @Param('id') id: string,
  //   @Body() updateMemberDto: Prisma.membersUpdateInput,
  // ) {
  //   return this.membersService.update(+id, updateMemberDto);
  // }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.membersService.remove(+id);
  // }
}
