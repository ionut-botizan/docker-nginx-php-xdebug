FROM php:7.2-fpm

RUN pecl install xdebug-2.6.0RC2 && docker-php-ext-enable xdebug
