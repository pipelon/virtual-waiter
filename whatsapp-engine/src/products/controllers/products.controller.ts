import {
  Controller,
  Get,
  HttpException,
  HttpStatus,
  Param,
} from '@nestjs/common';
import { ProductsService } from '../services/products.service';

@Controller({ path: 'products', version: '1' })
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Get()
  async findAll() {
    return await this.productsService.findAll();
  }

  @Get('adiciones')
  async getAdditions() {
    return await this.productsService.getAdditions();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    if (isNaN(+id)) {
      throw new HttpException('Invalid ID', HttpStatus.BAD_REQUEST);
    }
    return await this.productsService.findOne(+id);
  }
}
