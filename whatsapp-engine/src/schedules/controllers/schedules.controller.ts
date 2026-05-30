import {
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Param,
} from '@nestjs/common';
import { SchedulesService } from '../services/schedules.service';
import { DayOfWeek } from '../entities/schedule.entity';

@Controller({ path: 'schedules', version: '1' })
export class SchedulesController {
  constructor(private readonly schedulesService: SchedulesService) {}

  @Get()
  async findAll() {
    return await this.schedulesService.findAll();
  }

  @Get('is-open')
  async isOpen() {
    return await this.schedulesService.isOpen();
  }

  @Get(':day')
  async findScheduleByDay(@Param('day') day: DayOfWeek) {
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
    return await this.schedulesService.findScheduleByDay(day);
  }
}
