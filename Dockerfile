# Development stage
FROM node:22-alpine as develop-stage

WORKDIR /app

COPY /app/package*.json ./

RUN npm install

COPY /app .

# Build stage
FROM node:22-alpine as build-stage
WORKDIR /app
COPY /app/package*.json ./
RUN npm install
#RUN npm install -g nuxi
COPY /app  .
RUN npm run docs:build

# Production stage
FROM node:22-alpine as production-stage
WORKDIR /app
COPY --from=build-stage /app/.vitepress/dist /app
RUN npm install -g serve

# Expose production port
EXPOSE 5173

# Command to serve static files
CMD ["serve", "-s", ".", "-l", "5173"]