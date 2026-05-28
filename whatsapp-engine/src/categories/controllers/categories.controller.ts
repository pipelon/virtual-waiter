import { Controller, Get } from '@nestjs/common';
import { CategoriesService } from '../services/categories.service';

@Controller({ path: 'categories', version: '1' })
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) {}

  @Get()
  async findAll() {
    return await this.categoriesService.findAll();
  }
}
