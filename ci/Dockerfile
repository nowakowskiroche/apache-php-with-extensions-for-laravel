FROM php:7.2-apache
RUN apt-get update && apt-get install --no-install-recommends -y gnupg && apt-key update -y
RUN apt-get install --no-install-recommends -y automake \
    bash \
    ca-certificates \
    curl \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libnotify-bin \
    libpng-dev \
    libtool \
    mysql-client \
    nasm \
    python-pip \
    python-setuptools \
    software-properties-common \
    unzip \
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

# Install Composer with prestissimo for faster downloads
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "hirak/prestissimo:^0.3"

# Install AWS CLI, we need it for deployment tooling, but you may not
RUN pip install awscli && ln -s /usr/local/bin/aws /usr/bin/aws

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash && apt-get install --no-install-recommends -y nodejs && npm install -g gulp bower

# Install git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install --no-install-recommends -y git-lfs && \
    git lfs install && rm -rf /var/lib/apt/lists/* # cleanup caches when we're done
