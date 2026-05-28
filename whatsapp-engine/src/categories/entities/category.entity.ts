import { Product } from 'src/products/entities/product.entity';
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';

@Entity('categories')
export class Category {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({ length: 100 })
  name!: string;

  @Column({ type: 'text' })
  description!: string;

  @Column({ type: 'boolean' })
  active!: boolean;

  @Column({ type: 'datetime' })
  created!: Date;

  @Column({ length: 50 })
  created_by!: string;

  @Column({ type: 'datetime' })
  modified!: Date;

  @Column({ length: 50 })
  modified_by!: string;

  // 🔥 RELACIÓN: una categoría tiene muchos productos
  @OneToMany(() => Product, (product) => product.category)
  products!: Product[];
}
