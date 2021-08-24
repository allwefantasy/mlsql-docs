FROM nginx
WORKDIR /usr/share/nginx/html
ADD _book /usr/share/nginx/html
EXPOSE 80