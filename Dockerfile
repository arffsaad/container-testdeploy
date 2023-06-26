# Use an official PHP runtime as the base image
FROM php:latest

# Set the working directory
WORKDIR /var/www/html

RUN apt-get update && apt-get install -y default-mysql-client default-mysql-server
RUN service mysql start \
&& mysql -e "UPDATE mysql.user SET Password = PASSWORD('1234') WHERE User = 'root'" \
&& mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'" \
&& mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '1234'" \
&& mysql -e "GRANT ALL ON *.* TO 'root'@'%'" \
&& mysql -e "FLUSH PRIVILEGES"

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the PHP files into the container
COPY . /var/www/html

# Expose the port used by your PHP application (e.g., 80 for HTTP)
EXPOSE 80

# Start the PHP server
CMD ["php", "-S", "0.0.0.0:80", "server.php"]
