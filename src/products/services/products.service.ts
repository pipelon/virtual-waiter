import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import { Product } from '../entities/product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product)
    private readonly productRepository: Repository<Product>,
  ) {}

  async findAll() {
    return await this.productRepository.find({
      where: {
        active: true,
      },
    });
  }

  async findOne(id: number) {
    return await this.productRepository.findOne({ where: { id } });
  }
}
