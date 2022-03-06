FROM node:16-alpine

WORKDIR '/opt/ng'
COPY package.json package-lock.json decorate-angular-cli.js .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=0 /opt/ng/dist/apps/ui-showcase /usr/share/nginx/html