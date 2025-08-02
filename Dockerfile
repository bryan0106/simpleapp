# Stage 1: Build dependencies
FROM composer:2 AS composer_install

# Copy composer files
COPY composer.json composer.lock ./

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Stage 2: Final image
FROM richarvey/nginx-php-fpm:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the application code
COPY . /var/www/html

# Copy Nginx configuration
COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf

# Set file permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Expose port 80 for Nginx
EXPOSE 80
