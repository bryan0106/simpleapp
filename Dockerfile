# Use a base image with Nginx and PHP-FPM
FROM richarvey/nginx-php-fpm:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the application code into the container
COPY . /var/www/html

# Copy the custom Nginx configuration
COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf

# Install Composer dependencies and optimize
RUN composer install --no-dev --optimize

# Run migrations and seed the database during the build process
RUN php artisan migrate --force && php artisan db:seed --force

# Set file permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Expose port 80 for Nginx
EXPOSE 80
