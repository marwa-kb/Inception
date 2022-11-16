#!/bin/sh


#/usr/bin/mysql_install_db --user='root' --datadir='/var/lib/mysql' --basedir='/usr'
#/usr/bin/mysqld_safe --user='root' --datadir='/var/lib/mysql' & sleep 2

touch config
echo "CREATE DATABASE $MYSQL_DATABASE;" > config
echo "CREATE USER '$MYSQL_USER'@'wordpress.srcs_inception' IDENTIFIED BY '$MYSQL_PASSWORD';" >> config
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress.srcs_inception';" >> config
echo "FLUSH PRIVILEGES;" >> config

#if [ ! -f /var/lib/mysql/ibdata1 ]; then
    echo "Creating database ..."
    /usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql'
    /usr/bin/mysqld_safe --user='mysql' --datadir='/var/lib/mysql' &
    sleep 2
    
   # mysql < config
    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
    echo "CREATE USER '$MYSQL_USER'@'wordpress.srcs_inception' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'wordpress.srcs_inception';" | mysql
    echo "FLUSH PRIVILEGES;" | mysql

 #   pkill -9 mysqld
   # pkill -9 mariadb
  #  sleep 10
#fi

#mysql < config
#echo "DELETE FROM mysql.user WHERE user = '' AND host = 'localhost';" >> config
#echo "DELETE FROM mysql.user WHERE user = 'root' AND host = 'localhost';" >> config
#echo "FLUSH PRIVILEGES;" >> config

#some configuration to disable to connect without password

#/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=root < config
#/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=root --bootstrap --verbose=0 --skip-name-resolve --skip-grant-tables=0 < config
#rm config
#/usr/bin/mysqld --user='root' --datadir='/var/lib/mysql'
#mysql < config
pkill mysqld
/usr/bin/mysqld_safe --user='mysql' --datadir='/var/lib/mysql'
#sleep infinity