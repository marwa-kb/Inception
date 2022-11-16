#!/bin/sh

DIR='/var/www/localhost/htdocs'

cd $DIR

while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME &> /dev/null; do
	sleep 5
done

if [ "$(ls -A $DIR)" ]; then
    echo "$DIR is not empty"
else
    echo "$DIR is empty --> starting Wordpress configuration"

	wget https://wordpress.org/wordpress-6.0.3.zip && unzip wordpress-6.0.3.zip \
	&& rm wordpress-6.0.3.zip && mv wordpress/* . && rm -rf wordpress \
	&& chmod -R 777 /var/www/localhost/htdocs

	wp config create --dbname=$WORDPRESS_DB_NAME --dbhost=$WORDPRESS_DB_HOST \
	--dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD

	wp core install --url=mkhabou.42.fr --title=Welcome --admin_user=$WORDPRESS_ADMIN \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_MAIL

	wp user create $WORDPRESS_USER $WORDPRESS_USER_MAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD
	
	wp theme install inspiro --activate
fi

/usr/sbin/php-fpm7 -F