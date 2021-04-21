FROM alpine:3.12

RUN apk update && apk upgrade && apk add nginx openrc wget supervisor php7 php7-fpm \
	php7-opcache php7-gd php7-mysqli php7-xmlwriter php7-iconv php7-xml \
    php7-zlib php7-curl php7-mbstring php7-json php7-session php7-simplexml \
	php7-tokenizer libc6-compat

RUN adduser -D -g 'www' www
RUN mkdir -p /usr/share/webapps/
RUN mkdir /var/www/bswag_site.com
RUN mkdir -p /run/nginx 
COPY ./start_script.sh /tmp/start_script.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
RUN rc-update add nginx default

RUN wget -q https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /usr/share/webapps/phpmyadmin
RUN chown -R www:www /var/lib/nginx
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/bswag_site.com/phpmyadmin

COPY config.inc.php /usr/share/webapps/phpmyadmin/
RUN chown -R www:www /usr/share/webapps/
RUN chown -R www:www /var/www/bswag_site.com/

EXPOSE 5000

CMD ["/tmp/start_script.sh"]