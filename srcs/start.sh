#!/bin/bash/
service nginx start
service php7.3-fpm start
service mysql start
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql -u root --skip-password
mysql < /home/snpark_set.sql
service nginx reload
service php7.3-fpm reload
service mysql reload

bash
