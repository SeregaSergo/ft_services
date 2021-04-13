FROM alpine:3.12

RUN apk update && apk upgrade && apk add nginx openssl openssh supervisor

RUN mkdir /var/www/bswag_site.com
RUN mkdir -p /run/nginx 
COPY ./page /var/www/bswag_site.com
COPY ./start_script.sh /tmp/start_script.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt \
	-subj "/C=RU/ST=Moscow/L=.../O=.../OU=.../CN=.../emailAddress=bswag@student.21-school.ru"
RUN echo -e "bswag\nbswag" | adduser bswag
RUN adduser bswag root

EXPOSE 80 443 22
CMD ["/tmp/start_script.sh"]
