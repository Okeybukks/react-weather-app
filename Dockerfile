FROM node:18-alpine as builder
WORKDIR /app
COPY app .
RUN npm install
RUN npm run build

FROM nginx:stable-alpine3.17-slim
COPY --from=builder /app/build /usr/share/nginx/html
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY configurations/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]