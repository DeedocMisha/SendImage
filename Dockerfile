# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
# Включаем Corepack
RUN corepack enable

# Активируем нужную версию Yarn (будет взята из packageManager в package.json)
RUN corepack prepare yarn@4.7.0 --activate

# Устанавливаем зависимости
RUN yarn install
# Копируем остальные файлы проекта
COPY . .

# Собираем проект
RUN yarn build

# Экспонируем порт, который слушает NestJS
EXPOSE 4000

# Запускаем приложение из скомпилированного файла
CMD ["node", "dist/main.js"]

