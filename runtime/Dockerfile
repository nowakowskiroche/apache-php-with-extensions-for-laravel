FROM php:7.2-apache
RUN apt-get update && apt-get install --no-install-recommends -y gnupg && apt-key update -y
RUN apt-get install --no-install-recommends -y curl \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
    libtool \
    default-mysql-client \
    zlib1g-dev \
    g++ \
    && rm -rf /var/lib/apt/lists/* # cleanup caches when we're done

# Make sure we're using the right security level so things don't break
RUN vi -c '%s/SECLEVEL=2/SECLEVEL=1/g' /etc/ssl/openssl.cnf -c 'wq' 

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

# Install Pecl Dependencies
RUN pecl install grpc

# Configure GD for Glide Image Resizing
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip mysqli gd opcache pcntl exif bcmath && docker-php-ext-enable grpc
