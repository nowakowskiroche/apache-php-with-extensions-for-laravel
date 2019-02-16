FROM php:7.2-apache
RUN apt-get update && apt-get install -y gnupg && apt-key update -y && apt-get upgrade -y
RUN apt-get install -y curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libnotify-bin \
    libpng-dev \
    libtool \
    mysql-client \ 
    nasm \
    zip \
    zlib1g-dev

# Enable Apache Extensions We Need
RUN a2enmod proxy \
    proxy_ajp \
    proxy_http \
    rewrite \
    deflate \
    headers \
    proxy_balancer \ 
    proxy_connect \
    proxy_html \
    substitute \
    expires \
    vhost_alias

# Configure GD for Glide Image Resizing
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install pdo pdo_mysql zip mysqli gd opcache pcntl exif

