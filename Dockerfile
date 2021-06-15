FROM php:7.4-buster
MAINTAINER Unai Lopez <unai.lopez@vdshop.es>

ARG DEBIAN_FRONTEND=noninteractive

# install OS packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \  
    libcurl4-gnutls-dev \
    libzip-dev \
    libonig-dev\
    && apt-get clean
    
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install \
    bcmath \
    curl \
    gd \
    dom \
    intl \
    json \
    mbstring \
    pdo_mysql \
    opcache \
    soap \
    sockets \
    xml \
    xsl \
    zip
    
# Install extra utils
RUN curl -sS https://getcomposer.org/installer | php -- --1
RUN mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer
