#FROM mariadb
FROM alpine:3.15

VOLUME /home/mkhabou/data/mariadb

RUN	apk update \
	&& apk add mariadb mariadb-client \
	&& apk add openrc --no-cache

#RUN mysql_install_db --user=mysql \
#	&& cd '/usr' ; /usr/bin/mysqld_safe --datadir='./data'

#To start mysqld at boot time you have to copy
#support-files/mysql.server to the right place for your system

#RUN mysqladmin -u root -p password 'mdp'

#EXPOSE 3306

CMD ["bash"]