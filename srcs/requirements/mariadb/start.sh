#!/bin/sh

/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'
cd /usr ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
mysql -u root -p:password < /config.sql