FROM debian:buster

MAINTAINER Park, Sangjae <atimangel@naver.com>

EXPOSE 80 443

RUN apt-get update && apt-get upgrade &&\
apt-get install -y nginx openssl php7.3-fpm mariadb-server php-mysql php-mbstring
ADD /srcs/*.sh /home
ADD /srcs/*.sql /home

#webserver install
RUN rm /etc/nginx/sites-available/default
ADD srcs/localhost.key /etc/ssl/private/
ADD srcs/localhost.crt /etc/ssl/certs/
ADD srcs/default /etc/nginx/sites-available/


#db
ADD srcs/phpmyadmin/ /var/www/html/phpmyadmin/

#wordpress
ADD srcs/wordpress /var/www/html/wordpress/

CMD bash /home/start.sh
