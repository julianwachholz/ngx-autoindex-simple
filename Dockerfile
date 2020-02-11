FROM nginx:alpine
COPY static /etc/nginx/static
COPY nginx.conf /etc/nginx/nginx.conf
