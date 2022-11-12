#!/bin/sh

#mysql -u root -p:password < /config.sql
/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'
cd /usr ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
mysql << EOF
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@localhost;
FLUSH PRIVILEGES;
EOF
