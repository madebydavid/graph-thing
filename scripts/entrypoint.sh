#!/bin/bash
#
# Entry point

cd /opt/graph/www

# make sure composer deps are up to date
COMPOSER_HOME=/root composer install

# serve the website
/usr/sbin/apache2ctl -D FOREGROUND