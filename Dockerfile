FROM php:7.2-apache
RUN apt-get update 
RUN apt-get install -y gnupg && apt-key update -y && apt-get upgrade -y
RUN apt-get install -y bash git mc ca-certificates curl zip software-properties-common mysql-client mc python-pip
RUN apt-get install -y automake zlib1g-dev libtool libpng-dev libjpeg62-turbo-dev libfreetype6-dev software-properties-common nasm libnotify-bin
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html substitute expires vhost_alias
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install pdo pdo_mysql zip mysqli gd opcache pcntl exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "hirak/prestissimo:^0.3" 

RUN pip install awscli
RUN ln -s /usr/local/bin/aws /usr/bin/aws

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash
RUN apt-get install -y nodejs
# ssh-dss
RUN export GIT_SSH_COMMAND='ssh -oHostKeyAlgorithms=+ssh-dss'
# git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install git-lfs && \
    git lfs install
RUN npm install -g gulp bower
