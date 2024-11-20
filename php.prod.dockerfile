FROM php:8-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

# Cambiar la configuración para que escuche en todas las interfaces (0.0.0.0:9000)
RUN sed -i "s/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/" /usr/local/etc/php-fpm.d/www.conf


RUN mkdir -p /var/www/html/public

# Crear dos carpetas
RUN mkdir -p /var/www/html/storage/framework/views
RUN mkdir -p /var/www/html/bootstrap/cache
RUN mkdir -p /var/www/html/database

RUN docker-php-ext-install pdo pdo_mysql opcache
ADD opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Crear el archivo database.sqlite si no existe y establecer permisos correctos
RUN touch /var/www/html/database/database.sqlite

# Establecer permisos correctos para el directorio de almacenamiento
RUN chown -R ${PHPUSER}:${PHPGROUP} /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod 664 /var/www/html/database/database.sqlite


# CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
CMD ["php-fpm", "-F", "-y", "/usr/local/etc/php-fpm.d/www.conf", "-R"]