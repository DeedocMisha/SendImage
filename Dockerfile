# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем манифесты
COPY package.json yarn.lock ./

# Включаем Corepack, чтобы использовать нужную версию Yarn
RUN corepack enable

# Активируем нужную версию Yarn (4.7.0)
RUN corepack prepare yarn@4.7.0 --activate

# Очищаем кеш Yarn перед установкой зависимостей
RUN yarn cache clean

# Устанавливаем зависимости
RUN yarn install

# Копируем остальные файлы проекта
COPY . .

# Собираем проект
RUN yarn build

# Экспонируем порт
EXPOSE 4000

# Запускаем приложение
CMD ["node", "dist/main.js"]
