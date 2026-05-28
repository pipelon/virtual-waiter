import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { DayOfWeek, ExecutiveMenu } from '../entities/executive-menu.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class ExecutiveMenuService {
  constructor(
    @InjectRepository(ExecutiveMenu)
    private readonly executiveMenuRepository: Repository<ExecutiveMenu>,
  ) {}
  async findAll() {
    return this.executiveMenuRepository.find({
      where: {
        active: true,
      },
      select: {
        id: true,
        dayOfWeek: true,
        specialName: true,
        specialDescription: true,
        soupOptionsJson: true,
        proteinOptionsJson: true,
        carbOptionsJson: true,
        drinkOptionsJson: true,
        saladOptionsJson: true,
        price: true,
      },
    });
  }

  async findOneByDay(day: DayOfWeek) {
    const menu = await this.executiveMenuRepository.find({
      where: { dayOfWeek: day },
      select: {
        id: true,
        dayOfWeek: true,
        specialName: true,
        specialDescription: true,
        soupOptionsJson: true,
        proteinOptionsJson: true,
        carbOptionsJson: true,
        drinkOptionsJson: true,
        saladOptionsJson: true,
        price: true,
      },
    });

    if (!menu || menu.length === 0) {
      throw new HttpException(
        'Menu not found for the specified day',
        HttpStatus.NOT_FOUND,
      );
    }

    return menu;
  }
}
