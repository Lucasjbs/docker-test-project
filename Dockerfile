FROM node:20-alpine AS base

WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig.json ./

RUN npm install

COPY src ./src

RUN npm run build

FROM node:20-alpine

WORKDIR /usr/src/app

COPY --from=base /usr/src/app/package*.json ./
COPY --from=base /usr/src/app/node_modules ./node_modules
COPY --from=base /usr/src/app/build ./build

EXPOSE 3000

CMD ["node", "build/index.js"]