#!/bin/sh

sed -i 's/WORDPRESS_DB_NAME/'$WORDPRESS_DB_NAME'/g' /usr/share/webapps/wordpress/wp-config.php
sed -i 's/MYSQL_ROOT_USERNAME/'$MYSQL_ROOT_USERNAME'/g' /usr/share/webapps/wordpress/wp-config.php
sed -i 's/MYSQL_ROOT_PASSWORD/'$MYSQL_ROOT_PASSWORD'/g' /usr/share/webapps/wordpress/wp-config.php
sed -i 's/WORDPRESS_DB_HOST/'$WORDPRESS_DB_HOST'/g' /usr/share/webapps/wordpress/wp-config.php

/usr/bin/supervisord -c /etc/supervisord.conf