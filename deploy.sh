#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Run Composer installation
echo "Running Composer install..."
composer install --no-dev --optimize --no-interaction

# Clear and cache configs
echo "Caching configuration and routes..."
php artisan config:cache
php artisan route:cache

# Run database migrations
echo "Running migrations..."
php artisan migrate --force

# Seed the database
echo "Seeding database..."
php artisan db:seed --force

echo "Deployment script finished."