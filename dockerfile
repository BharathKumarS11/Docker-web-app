FROM nginx:1.29-alpine

WORKDIR /usr/share/nginx/html

COPY index.html .

EXPOSE 80
