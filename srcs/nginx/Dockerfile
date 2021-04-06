FROM alpine:3.12

RUN apk update && apk upgrade && apk add nginx openssl

RUN mkdir /var/www/bswag_site.com
COPY ./page /var/www/bswag_site.com
COPY ./start_script.sh /tmp/start_script.sh
COPY ./bswag_site.com /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt \
	-subj "/C=RU/ST=Moscow/L=.../O=.../OU=.../CN=.../emailAddress=bswag@student.21-school.ru"

RUN mkdir -p /run/nginx 
EXPOSE 80 443

CMD ["/tmp/start_script.sh"]
