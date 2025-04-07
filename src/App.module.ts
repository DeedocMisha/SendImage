import { Module } from '@nestjs/common';
import { AppController } from './App.controller';
import { AppService } from './App.service';

@Module({
    imports: [],  // Если ты хочешь подключить другие модули, например, для работы с базой данных
    controllers: [AppController],  // Здесь регистрируются все контроллеры
    providers: [AppService],  // И сервисы, которые используются в контроллерах
})
export class AppModule {}
