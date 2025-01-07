FROM php:8.0.20-fpm-alpine

WORKDIR /app

RUN apk add --no-cache \
    curl \
    libzip-dev \
    nginx \
    unzip \
    zlib-dev \
    && docker-php-ext-install pdo pdo_mysql sockets zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer  
COPY . .

RUN composer install --no-dev --optimize-autoloader \
    && adduser -D -u 1000 app-user \
    && chown -R app-user:app-user /app /var/log/nginx \
    && chown -R app-user:app-user /var/lib/nginx /var/log/nginx \
    && chown -R app-user:app-user /run/nginx \
    && chmod -R 775 /run/nginx /var/lib/nginx /var/lib/nginx/logs /var/log/nginx \
    && find /app -type d -exec chmod 775 {} \; \
    && find /app -type f -exec chmod 664 {} \; \
    && rm -rf /root/.composer/cache

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
USER app-user

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
