import {
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Param,
} from '@nestjs/common';
import { ExecutiveMenuService } from '../services/executive-menu.service';
import { DayOfWeek } from '../entities/executive-menu.entity';

@Controller({ path: 'executive-menu', version: '1' })
export class ExecutiveMenuController {
  constructor(private readonly executiveMenuService: ExecutiveMenuService) {}

  @Get()
  async findAll() {
    return await this.executiveMenuService.findAll();
  }

  @Get(':day')
  async findOne(@Param('day') day: DayOfWeek) {
    const validDays = [
      'lunes',
      'martes',
      'miércoles',
      'jueves',
      'viernes',
      'sábado',
      'domingo',
    ];
    if (!day || !validDays.includes(day)) {
      throw new HttpException(
        `Invalid day. Please provide one of the following values: ${validDays.join(', ')}`,
        HttpStatus.BAD_REQUEST,
      );
    }
    return await this.executiveMenuService.findOneByDay(day);
  }
}
