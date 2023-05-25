
FROM php:8.0-fpm as php
# FROM composer as composer


WORKDIR /test

COPY . .

ARG PROJECT_DIR=""
ENV PROJECT_DIR="${PROJECT_DIR}"

# VOLUME "${PROJECT_DIR}"
VOLUME ["/my_volume"]

# RUN "composer install --no-dev -d /my_volume";echo 1
# RUN "mkdir /my_volume/testtt";echo 1

RUN ln -s /my_volume/vendor ./vendor
RUN ln -s /my_volume/app ./app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update -qq \
    && apt-get install -qy --no-install-recommends \
        zip \
        unzip \
        wget