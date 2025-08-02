# Start with a base image that includes Nginx and PHP-FPM
FROM richarvey/nginx-php-fpm:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the application code into the container
COPY . /var/www/html

# Copy the custom Nginx configuration
COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf

# Install Composer dependencies
RUN composer install --no-dev --optimize --no-interaction

# Set permissions for the storage directory
RUN chown -R www-data:www-data storage bootstrap/cache

# Expose port 80 for Nginx
EXPOSE 80

# The start command is handled by the base image's entrypoint
