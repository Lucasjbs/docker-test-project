FROM node:20-alpine AS base

WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig.json ./
COPY .env.docker .env
COPY init.sql ./init.sql

RUN npm install

COPY src ./src

RUN npm run build

FROM node:20-alpine

WORKDIR /usr/src/app

COPY --from=base /usr/src/app/package*.json ./
COPY --from=base /usr/src/app/node_modules ./node_modules
COPY --from=base /usr/src/app/build ./build
COPY --from=base /usr/src/app/.env ./
COPY --from=base /usr/src/app/init.sql /usr/src/init.sql

EXPOSE 3000

CMD ["node", "build/index.js"]