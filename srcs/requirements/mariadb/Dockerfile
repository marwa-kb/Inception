FROM alpine:3.15

#VOLUME /home/mkhabou/data/mariadb
#VOLUME /var/lib/mysql

RUN	apk update \
	&& apk add mariadb mariadb-client
	#&& apk add openrc --no-cache \
	#&& mkdir -p /run/openrc/softlevel

#RUN /etc/init.d/mariadb setup \
#	&& cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &


#RUN mysql_install_db --user=mysql \
#	&& cd '/usr' ; /usr/bin/mysqld_safe --datadir='./data'

#cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

#To start mysqld at boot time you have to copy
#support-files/mysql.server to the right place for your system

#RUN mysqladmin -u root -p password 'mdp'

EXPOSE 3306

#RUN /usr/bin/mysql_install_db --user='mysql' --datadir='/var/lib/mysql' \
#	&& cd /usr && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' '&' \
#	&& mysqld_safe &

#WORKDIR /usr
#COPY config.sh /usr
#RUN chmod +x config.sh
#RUN ./config.sh

#RUN /etc/init.d/mariadb setup
#RUN /etc/init.d/mariadb start

CMD ["ls"]