  import { NestFactory } from '@nestjs/core';
  import { AppModule } from './App.module';
  import { join } from 'path';
  import * as express from 'express';

  async function bootstrap() {
    const app = await NestFactory.create(AppModule);

    // Статическая подача папки 'public'
    app.use('/Jongler/static', express.static(join(__dirname, '..', 'public')));

    await app.listen(4000);
  }
  bootstrap();
