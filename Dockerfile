# ---- Base Image ----
FROM node:20-alpine AS base

WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY src ./src

# ---- Build Stage ----
RUN npm run build

# ---- Run Stage ----
FROM node:20-alpine

WORKDIR /usr/src/app

# Copy only necessary files from the build stage
COPY --from=base /usr/src/app/package*.json ./
COPY --from=base /usr/src/app/node_modules ./node_modules
COPY --from=base /usr/src/app/build ./build

EXPOSE 3000

CMD ["node", "build/index.js"]