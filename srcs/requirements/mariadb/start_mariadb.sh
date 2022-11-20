#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]
then
    echo "..........Creating MariaDB database........."

    /usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql' > /dev/null
    /usr/bin/mysqld_safe --user='mysql' &
    sleep 2

    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
	echo "DROP USER ''@'localhost';" | mysql  -u root -p$MYSQL_ROOT_PASSWORD
    echo "FLUSH PRIVILEGES;" | mysql -u root -p$MYSQL_ROOT_PASSWORD

    echo "========== MariaDB database created ========="
else
    echo "====== MariaDB database already exists ======"
    pkill mysqld
    /usr/bin/mysqld_safe --user='mysql' &
    sleep 2
fi

pkill mariadbd
echo "✅ Starting MariaDB container"
mysqld --user='mysql' --datadir='/var/lib/mysql'