FROM node:lts-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve the build files with a lightweight web server
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html