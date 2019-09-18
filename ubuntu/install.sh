#!bin/sh

# set variables
export DEBIAN_FRONTEND="noninteractive"
TEMP_PACKAGES="wget ca-certificates bzip2"
NODE_VERSION="10.15.3"

# install all needed packages
apt-get update
apt-get -y --no-install-recommends install build-essential git nano mariadb-server mariadb-client nginx nodejs npm

# install temporary packages
apt-get -y --no-install-recommends install $TEMP_PACKAGES

# install node
wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz
tar -C /usr/local --strip-components 1 -xJf node-v${NODE_VERSION}-linux-x64.tar.xz
rm node-v${NODE_VERSION}-linux-x64.tar.xz

# configure and start mariadb
rm -rf /var/lib/mysql/*
mysql_install_db
service mysql start
mysql -u root --password="" -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user'; GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';";

# remove temporary packages
apt-get -y remove $TEMP_PACKAGES
apt-get -y autoremove
apt-get clean
rm -rf /var/lib/apt/lists/*
