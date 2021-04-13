FROM alpine:3.12

RUN apk update && apk upgrade && apk add nginx wget supervisor php7-fpm \
	php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql \
	php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext \
	php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype \
	openssl mysql-client php-mysqli

RUN adduser -D -g 'www' www
RUN mkdir -p /usr/share/webapps/
RUN mkdir /var/www/bswag_site.com
RUN mkdir -p /run/nginx 
COPY ./start_script.sh /tmp/start_script.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

RUN wget -q https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /usr/share/webapps/phpmyadmin
COPY ./index.php /usr/share/webapps/phpmyadmin
RUN chmod -R 777 /usr/share/webapps/
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/bswag_site.com/phpmyadmin
RUN export PHP_FPM_USER="www" PHP_FPM_GROUP="www" PHP_FPM_LISTEN_MODE="0660" \
PHP_MEMORY_LIMIT="512M" PHP_MAX_UPLOAD="50M" PHP_MAX_FILE_UPLOAD="200" \
PHP_MAX_POST="100M" PHP_DISPLAY_ERRORS="On" PHP_DISPLAY_STARTUP_ERRORS="On" \
PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
PHP_CGI_FIX_PATHINFO=0

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/cert.key -out /etc/ssl/cert.crt \
	-subj "/C=RU/ST=Moscow/L=.../O=.../OU=.../CN=.../emailAddress=bswag@student.21-school.ru"

EXPOSE 5000

CMD ["/tmp/start_script.sh"]