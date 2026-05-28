import { Module } from '@nestjs/common';
import { ProductsController } from './controllers/products.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Product } from './entities/product.entity';
import { ProductsService } from './services/products.service';

@Module({
  controllers: [ProductsController],
  providers: [ProductsService],
  imports: [TypeOrmModule.forFeature([Product])],
})
export class ProductsModule {}
