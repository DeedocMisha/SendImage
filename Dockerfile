# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем Yarn-файлы и манифест
COPY package.json yarn.lock .yarnrc.yml ./

# Копируем PnP данные
COPY .yarn/ .yarn/

# Включаем Corepack
RUN corepack enable

# Активируем нужную версию Yarn (будет взята из packageManager в package.json)
RUN corepack prepare yarn@4.7.0 --activate

# Устанавливаем зависимости
RUN yarn install

# Копируем остальной проект
COPY . .

# Собираем проект
RUN yarn build

# Экспонируем порт, который слушает NestJS
EXPOSE 4000

# Запускаем приложение из скомпилированного файла
CMD ["node", "dist/main.js"]
