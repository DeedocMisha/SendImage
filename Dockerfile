# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем манифесты
COPY package.json yarn.lock ./

# Устанавливаем зависимости (используется node_modules)
RUN yarn install

# Копируем остальные файлы проекта
COPY . .

# Собираем проект
RUN yarn build

# Экспонируем порт
EXPOSE 4000

# Запускаем приложение
CMD ["node", "dist/main.js"]
