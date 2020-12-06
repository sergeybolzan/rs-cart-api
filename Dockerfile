# Base
FROM node:12-alpine AS base

WORKDIR /app

# Dependencies
COPY package*.json ./
RUN npm i && npm cache clean --force

# Build
WORKDIR /app
COPY . .
RUN npm run build

# Application
FROM node:12-alpine AS application

COPY --from=base /app/package*.json ./
RUN npm i --only=production && npm i pm2 -g
COPY --from=base /app/dist ./dist

USER node
ENV PORT=8080
EXPOSE 8080

CMD ["pm2-runtime", "dist/main.js"]