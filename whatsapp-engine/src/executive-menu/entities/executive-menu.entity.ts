import { Entity, PrimaryGeneratedColumn, Column, Index } from 'typeorm';

export enum DayOfWeek {
  LUNES = 'lunes',
  MARTES = 'martes',
  MIERCOLES = 'miércoles',
  JUEVES = 'jueves',
  VIERNES = 'viernes',
  SABADO = 'sábado',
  DOMINGO = 'domingo',
}

@Entity('executive_menus')
export class ExecutiveMenu {
  @PrimaryGeneratedColumn()
  id!: number;

  @Index('idx_day_of_week')
  @Column({
    type: 'enum',
    enum: DayOfWeek,
    name: 'day_of_week', // 👈 CLAVE: columna real en DB
  })
  dayOfWeek!: DayOfWeek;

  @Column({
    type: 'varchar',
    length: 255,
    nullable: true,
    name: 'special_name',
  })
  specialName?: string;

  @Column({
    type: 'text',
    nullable: true,
    name: 'special_description',
  })
  specialDescription?: string;

  @Column({
    type: 'json',
    nullable: true,
    name: 'soup_options_json',
  })
  soupOptionsJson?: any;

  @Column({
    type: 'json',
    nullable: true,
    name: 'protein_options_json',
  })
  proteinOptionsJson?: any;

  @Column({
    type: 'json',
    nullable: true,
    name: 'carb_options_json',
  })
  carbOptionsJson?: any;

  @Column({
    type: 'json',
    nullable: true,
    name: 'drink_options_json',
  })
  drinkOptionsJson?: any;

  @Column({
    type: 'json',
    nullable: true,
    name: 'salad_options_json',
  })
  saladOptionsJson?: any;

  @Column({
    type: 'text',
    nullable: true,
    name: 'additional_notes',
  })
  additionalNotes?: string;

  @Column({
    type: 'decimal',
    precision: 10,
    scale: 2,
    default: 0,
  })
  price!: number;

  @Index('idx_is_active')
  @Column({
    type: 'boolean',
    default: true,
  })
  active!: boolean;

  @Column({
    type: 'datetime',
  })
  created!: Date;

  @Column({
    type: 'varchar',
    length: 50,
    name: 'created_by',
  })
  createdBy!: string;

  @Column({
    type: 'datetime',
  })
  modified!: Date;

  @Column({
    type: 'varchar',
    length: 50,
    name: 'modified_by',
  })
  modifiedBy!: string;
}
