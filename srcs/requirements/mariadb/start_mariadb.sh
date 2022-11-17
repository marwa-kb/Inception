#!/bin/sh

if [ ! -f /var/lib/mysql/ibdata1 ]
then
    echo "⏳ creating MariaDB database..."

    /usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql' > /dev/null
    /usr/bin/mysqld_safe --user='mysql' &
    sleep 2

    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
    echo "CREATE USER '$MYSQL_USER'@'wordpress.srcs_inception' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress.srcs_inception';" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root -ppassword
    echo "🟣 MariaDB database created"

    pkill mariadbd
else
    echo "🟣 MariaDB database already exists"
fi

echo "✅ starting mariadb container"
mysqld --user='mysql'