#!/bin/sh

#mysql -u root -ppassword < /config.sql

/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'

cd /usr ;

touch tmp.sql
echo "CREATE DATABASE $MYSQL_DATABASE;" > tmp
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> tmp
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@%;" >> tmp
echo "FLUSH PRIVILEGES;" >> tmp

#some configuration to disable to connect without password

< tmp /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

rm tmp