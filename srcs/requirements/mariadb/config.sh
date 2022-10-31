/etc/init.d/mariadb setup
cd 'usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 5
mysql