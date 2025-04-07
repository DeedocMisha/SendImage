import { NestFactory } from '@nestjs/core';
import { AppModule } from './App.module';
import { join } from 'path';
import { NestExpressApplication } from '@nestjs/platform-express';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // Используем встроенный метод вместо express.static
  app.useStaticAssets(join(__dirname, '..', 'public'), {
    prefix: '/static/', // Тот же URL-префикс
  });

  await app.listen(4000);
}
bootstrap();