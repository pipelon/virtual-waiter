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

  async findAll(): Promise<
    {
      category: { name: string };
      products: { name: string; description: string; price: number }[];
    }[]
  > {
    const products = await this.productRepository.find({
      relations: {
        category: true,
      },
      where: {
        active: true,
        category: {
          active: true,
        },
      },
    });

    const grouped = products.reduce(
      (acc, product) => {
        const categoryId = product.category.id;

        if (!acc[categoryId]) {
          acc[categoryId] = {
            category: {
              name: product.category.name,
            },
            products: [],
          };
        }

        acc[categoryId].products.push({
          name: product.name,
          description: product.description,
          price: product.price,
          preparation_time_minutes: `${product.preparation_time_minutes} minutos`,
        });

        return acc;
      },
      {} as Record<
        number,
        {
          category: { name: string };
          products: {
            name: string;
            description: string;
            price: number;
            preparation_time_minutes: string;
          }[];
        }
      >,
    );

    return Object.values(grouped);
  }

  async findOne(id: number) {
    return await this.productRepository.findOne({ where: { id } });
  }
}
