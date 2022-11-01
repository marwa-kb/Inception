FROM alpine:3.15

RUN	apk update \
	&& apk add nginx openssl

RUN mkdir /etc/ssl/private \
	&& chmod 700 /etc/ssl/private

ADD ./certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
ADD ./certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
ADD nginx.conf /etc/nginx/

COPY ./index.html /usr/share/nginx/html/index.html

#RUN echo "127.0.0.1 mkhabou.42.fr" >> /etc/hosts
#RUN sed -i 's/localhost/mkhabou.42.fr/' /etc/hosts

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]