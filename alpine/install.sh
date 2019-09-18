#!bin/sh

# set variables
export DEBIAN_FRONTEND="noninteractive"
CURL_VERSION="7.56.1"
TEMP_PACKAGES="bzip2 g++ make perl"

# install all needed packages
echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >>/etc/apk/repositories 
apk update
apk --no-cache add openrc openssl openssl-dev nghttp2 nghttp2-dev ca-certificates mariadb mariadb-client nginx php7-fpm php7-mysqli php7-curl php7-gmp

# install temporary packages
apk --no-cache add $TEMP_PACKAGES

# configure and start mariadb
rm -rf /var/lib/mysql/*
mysql_install_db
rc-service mysql-server start

# install phpmyadmin
echo 'phpmyadmin phpmyadmin/mysql/app-pass password phpmyadmin' | debconf-set-selections
apk --no-cache add phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html

# remove temporary packages
apk del $TEMP_PACKAGES
