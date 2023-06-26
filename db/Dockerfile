FROM mysql/mysql-server:8.0

RUN service mysql start \
&& mysql -e "UPDATE mysql.user SET Password = PASSWORD('1234') WHERE User = 'root'" \
&& mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'" \
&& mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '1234'" \
&& mysql -e "GRANT ALL ON *.* TO 'root'@'%'" \
&& mysql -e "FLUSH PRIVILEGES"

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

EXPOSE 3306
