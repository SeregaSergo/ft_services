#!/bin/sh

openrc-init
openrc boot
touch /run/openrc/softlevel
/usr/bin/mysql_install_db --user=root --datadir=/var/lib/mysql
service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER '$MYSQL_ROOT_USERNAME'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_ROOT_USERNAME'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#mysql wordpress -u root < wordpress.sql

sleep infinity