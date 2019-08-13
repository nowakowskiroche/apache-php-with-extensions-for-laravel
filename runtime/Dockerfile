FROM php:7.2-apache
RUN apt-get update && apt-get install --no-install-recommends -y gnupg && apt-key update -y
RUN apt-get install --no-install-recommends -y curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libtool \
    mysql-client \
    zlib1g-dev \
    vim \
    && rm -rf /var/lib/apt/lists/* # cleanup caches when we're done

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
