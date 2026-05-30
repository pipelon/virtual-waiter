import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { DayOfWeek, Schedule } from '../entities/schedule.entity';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class SchedulesService {
  constructor(
    @InjectRepository(Schedule)
    private readonly scheduleRepository: Repository<Schedule>,
  ) {}

  async findAll() {
    return await this.scheduleRepository.find({
      select: {
        id: true,
        dayOfWeek: true,
        isOpen: true,
        openTime: true,
        closeTime: true,
      },
    });
  }

  async findScheduleByDay(day: DayOfWeek) {
    const schedule = await this.scheduleRepository.findOne({
      select: {
        id: true,
        dayOfWeek: true,
        isOpen: true,
        openTime: true,
        closeTime: true,
      },
      where: {
        dayOfWeek: day,
      },
    });
    if (!schedule) {
      throw new HttpException(
        'Schedule not found for the specified day',
        HttpStatus.NOT_FOUND,
      );
    }
    return schedule;
  }

  async isOpen() {
    const now = new Date();

    const daysMap: Record<number, DayOfWeek> = {
      0: DayOfWeek.DOMINGO,
      1: DayOfWeek.LUNES,
      2: DayOfWeek.MARTES,
      3: DayOfWeek.MIERCOLES,
      4: DayOfWeek.JUEVES,
      5: DayOfWeek.VIERNES,
      6: DayOfWeek.SABADO,
    };

    const currentDay = daysMap[now.getDay()];

    const schedule = await this.scheduleRepository.findOne({
      where: {
        dayOfWeek: currentDay,
      },
    });

    if (!schedule || !schedule.isOpen) {
      return {
        isOpen: false,
        message: 'Restaurant is closed today',
      };
    }

    const currentTime = now.toTimeString().slice(0, 8);

    if (
      !schedule.openTime ||
      !schedule.closeTime ||
      currentTime < schedule.openTime ||
      currentTime > schedule.closeTime
    ) {
      return {
        isOpen: false,
        message: 'Restaurant is currently closed',
        openTime: schedule.openTime,
        closeTime: schedule.closeTime,
      };
    }

    return {
      isOpen: true,
      message: 'Restaurant is open',
      openTime: schedule.openTime,
      closeTime: schedule.closeTime,
    };
  }
}
