# Use a base image with PHP-FPM
FROM php:8.1

# Install Nginx and other necessary packages
RUN apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Set the working directory
WORKDIR /var/www/html

# Copy the PHP files into the container
COPY index.php /var/www/html

# Expose the port used by Nginx (e.g., 80 for HTTP)
EXPOSE 80

# Start PHP-FPM and Nginx
CMD service php8.1-fpm start && nginx -g 'daemon off;'
