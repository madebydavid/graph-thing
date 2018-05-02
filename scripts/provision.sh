#!/bin/bash
#
# Base provisioning script

# die if any command fails
set -e

export DEBIAN_FRONTEND=noninteractive

# make sure apt is up to date 
apt-get update -qq --fix-missing
apt-get install -y --no-install-recommends apt-utils

# Setup LAMP stack
apt-get install -y php7.0 php7.0-mysql
apt-get install -y apache2 libapache2-mod-php7.0
apt-get install -y composer

apt-get install -y php-curl
apt-get install -y php-mbstring
apt-get install -y php7.0-xml
apt-get install -y php-mcrypt
# Disabled to speed up install - probably not needed
# apt-get install -y php-imagick

# Speeds up the composer install
apt-get install -y zip unzip php7.0-zip

# needed so we can dump the db
apt-get install -y mysql-client

# Enable mod rewrite in Apache
a2enmod rewrite

# setup virtualhost
cat << "EOF" > /etc/apache2/sites-available/001-graph.conf
<VirtualHost *:80>

    ServerAdmin webmaster@localhost

    DocumentRoot /opt/graph/www
    <Directory "/opt/graph/www">
        Require all granted
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/graph-error.log
    CustomLog ${APACHE_LOG_DIR}/graph-access.log combined

</VirtualHost>
EOF

# Enable the virtual host
a2ensite 001-graph
a2dissite 000-default
