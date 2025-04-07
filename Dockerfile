# Этап сборки
FROM node:18 AS builder

WORKDIR /app

# Enable corepack (to use the correct Yarn version)
RUN corepack enable

COPY . .
RUN yarn install

# Копируем исходный код и собираем проект

RUN yarn build  # Эта команда создаст папку dist/

# Этап запуска
FROM node:18

WORKDIR /app

# Enable corepack in the final image too
RUN corepack enable

# Копируем только необходимое
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public

EXPOSE 4000

CMD ["node", "dist/main.js"]