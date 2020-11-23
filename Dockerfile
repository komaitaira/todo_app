FROM php:7.3-fpm

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        zlib1g-dev \
        zip \
        unzip \
        libpq-dev \
        git
# pgsql
RUN docker-php-ext-install pdo pdo_mysql mbstring
# compose install 1系に固定
WORKDIR /var/www/src
# COPY ./src/todo_app/composer.json /var/www/src
RUN curl -O https://getcomposer.org/composer-1.phar
RUN mv composer-1.phar composer.phar
RUN chmod 755 composer.phar
RUN mv composer.phar /usr/local/bin
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
# RUN composer install
