# Use an official PHP runtime as the base image
FROM php:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the PHP files into the container
COPY server.php /var/www/html

# Expose the port used by your PHP application (e.g., 80 for HTTP)
EXPOSE 80

# Start the PHP server
CMD ["php", "-S", "0.0.0.0:80", "server.php"]
