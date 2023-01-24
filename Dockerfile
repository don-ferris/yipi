NOT THE FINAL FILE...

# Use the Alpine Linux image as the base image
FROM alpine:latest

# Update packages and install Nginx, MySQL, PHP and nano
RUN apk update && apk add nginx mysql mysql-client php7 php7-fpm php7-mysqli php7-json nano

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the PHP-FPM configuration file
COPY php-fpm.conf /etc/php7/php-fpm.conf

# Copy the MySQL configuration file
COPY my.cnf /etc/mysql/my.cnf

# Install certbot
RUN apk add certbot

# Register and obtain the Let's Encrypt certificate
RUN certbot certonly --webroot -w /var/www/html -d example.com

# Copy the SSL certificate and key
COPY ssl/fullchain.pem /etc/ssl/certs/example.com.crt
COPY ssl/privkey.pem /etc/ssl/private/example.com.key

# Start Nginx, PHP-FPM, and MySQL
CMD ["nginx", "-g", "daemon off;"]
CMD ["php-fpm7"]
CMD ["mysqld"]

# Bind the /var/www/html directory in the container to the /path/to/wwwroot directory on the host
VOLUME ["/var/www/html:/path/to/wwwroot"]
