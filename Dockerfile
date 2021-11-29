FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# docker run -p 8080:80 react-nginx