# Use a base image with PHP-FPM
FROM php:8.1

# Copy the PHP files into the container
COPY index.php /var/www/html

# Expose the port used by Nginx (e.g., 80 for HTTP)
EXPOSE 80

# Start PHP-FPM and Nginx
CMD ["php", "-S", "0.0.0.0:80"]
