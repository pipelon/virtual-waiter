import { Module } from '@nestjs/common';
import { ExecutiveMenuController } from './controllers/executive-menu.controller';
import { ExecutiveMenuService } from './services/executive-menu.service';
import { ExecutiveMenu } from './entities/executive-menu.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  controllers: [ExecutiveMenuController],
  providers: [ExecutiveMenuService],
  imports: [TypeOrmModule.forFeature([ExecutiveMenu])],
})
export class ExecutiveMenuModule {}
