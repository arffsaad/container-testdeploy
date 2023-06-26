# Use the official MySQL 8 image as the base image
FROM mysql:8

# Set the MySQL root password (change it as per your preference)
ENV MYSQL_ROOT_PASSWORD=root

# Allow remote connections and bind to interface 0.0.0.0
RUN sed -i 's/^bind-address\s*=.*$/bind-address=0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Create a database and user
ENV MYSQL_DATABASE=myappdb
ENV MYSQL_USER=adminApp
ENV MYSQL_PASSWORD=1234

# Copy SQL script to initialize the database and user
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
