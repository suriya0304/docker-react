FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx as run
EXPOSE 80
COPY --from=builder /app/build usr/share/nginx/html

