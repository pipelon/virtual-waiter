import { Injectable } from '@nestjs/common';
import { Category } from '../entities/category.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class CategoriesService {
  constructor(
    @InjectRepository(Category)
    private readonly categoryMenuRepository: Repository<Category>,
  ) {}
  async findAll() {
    return await this.categoryMenuRepository.find({
      where: {
        active: true,
      },
    });
  }
}
