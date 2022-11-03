FROM alpine:3.15

RUN apk update \
	&& apk add nginx \
	&& apk add php7 php7-fpm php7-opcache \
	&& apk add php7-gd php7-mysqli php7-curl 
#	&& apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

ADD nginx.conf /etc/nginx
RUN mkdir -p /var/www/localhost/htdocs 
#	&& touch /var/www/localhost/htdocs/index.php \
#	&& echo "<?php phpinfo();" > /var/www/localhost/htdocs/index.php
#

#RUN mkdir -p /usr/share/webapps/ \
#	&& cd /usr/share/webapps/ && wget http://wordpress.org/latest.tar.gz \
#	&& tar -xzvf latest.tar.gz && rm latest.tar.gz \
#	&& ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

EXPOSE 80

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]