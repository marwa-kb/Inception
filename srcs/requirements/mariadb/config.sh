#!/bin/sh

#/etc/init.d/mariadb setup
#/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'

#/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

#/etc/init.d/mariadb start


#/etc/init.d/mariadb setup
#/etc/init.d/mariadb stop

/usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'
cd /usr ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'


