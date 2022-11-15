#!/bin/sh

#mysql -u root -ppassword < /config.sql

/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'

touch config
echo "CREATE DATABASE $MYSQL_DATABASE;" > config
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> config
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> config
echo "FLUSH PRIVILEGES;" >> config

#some configuration to disable to connect without password

#/usr/bin/mysqld_safe --datadir='/var/lib/mysql' < config

#rm config
sleep infinity