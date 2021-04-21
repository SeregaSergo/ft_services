FROM alpine:3.12

RUN apk update && apk upgrade && apk add nginx wget supervisor php7-fpm php7-mcrypt \
	php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip \
	php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
	php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 \
	php7-iconv php7-pdo_dblib php7-curl php7-ctype openssl mysql-client php7-zlib

RUN adduser -D -g 'www' www
RUN mkdir -p /usr/share/webapps/ && \
	mkdir /var/www/bswag_site.com && \
	mkdir -p /run/nginx 
COPY ./start_script.sh /tmp/start_script.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

RUN wget -q https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xzf latest-ru_RU.tar.gz
RUN rm latest-ru_RU.tar.gz
RUN mv wordpress /usr/share/webapps/wordpress
COPY ./wp-config.php /usr/share/webapps/wordpress/
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/bswag_site.com/wordpress

# VOLUME /mnt/mysql

EXPOSE 5050

CMD ["/tmp/start_script.sh"]