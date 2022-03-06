FROM node:16-alpine

WORKDIR '/opt/ng'
COPY package.json .
COPY package-lock.json .
COPY decorate-angular-cli.js .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80

COPY --from=0 /opt/ng/app/dist/apps/ui-showcase /usr/share/nginx/html