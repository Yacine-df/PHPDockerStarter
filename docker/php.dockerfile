FROM php:8.2-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/user = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

CMD [ "php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]