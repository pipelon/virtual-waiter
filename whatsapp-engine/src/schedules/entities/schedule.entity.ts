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

@Entity('schedules')
export class Schedule {
  @PrimaryGeneratedColumn()
  id!: number;

  @Index('idx_day')
  @Column({
    name: 'day_of_week',
    type: 'enum',
    enum: DayOfWeek,
  })
  dayOfWeek!: DayOfWeek;

  @Column({
    name: 'is_open',
    type: 'boolean',
    default: true,
  })
  isOpen!: boolean;

  @Column({
    name: 'open_time',
    type: 'time',
    nullable: true,
  })
  openTime?: string;

  @Column({
    name: 'close_time',
    type: 'time',
    nullable: true,
  })
  closeTime?: string;

  @Column({
    type: 'datetime',
  })
  created!: Date;

  @Column({
    name: 'created_by',
    type: 'varchar',
    length: 50,
  })
  createdBy!: string;

  @Column({
    type: 'datetime',
  })
  modified!: Date;

  @Column({
    name: 'modified_by',
    type: 'varchar',
    length: 50,
  })
  modifiedBy!: string;
}
