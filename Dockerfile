FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
COPY decorate-angular-cli.js .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=builder /app/dist/apps/ui-showcase /usr/share/nginx/html