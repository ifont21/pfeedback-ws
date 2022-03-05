FROM node:16-alpine as builder

WORKDIR '/app'
# COPY package.json .
# COPY decorate-angular-cli.js .

# RUN npm install
# COPY . .
# RUN npm run build
COPY dist/apps/ui-showcase .

FROM nginx
# Copy the build folder generated from the container
COPY --from=builder /app /usr/share/nginx/html