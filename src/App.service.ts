    import { Injectable } from '@nestjs/common';

    @Injectable()
    export class AppService {
        // Пример метода, который можно вызвать из контроллера
        getHello(): string {
            return 'Hello, World!';
        }
    }
