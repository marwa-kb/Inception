FROM alpine:3.15

RUN	apk update \
	&& apk add bash nginx openssl

RUN mkdir /etc/ssl/private \
	&& chmod 700 /etc/ssl/private
	
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=IDF/O=Ecole 42/CN=mkhabou.42.fr" \
	-addext "subjectAltName=DNS:mkhabou.42.fr" -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

#ADD ./certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
#ADD ./certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
ADD nginx.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]