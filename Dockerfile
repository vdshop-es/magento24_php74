FROM ubuntu:20.04
MAINTAINER Unai Lopez <unai.lopez.vdshop@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

# install OS packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    nano \
    php \
    php-bcmath \
    php-curl \
    php-gd \
    php-dom \
    php-intl \
    php-json \
    php-mbstring \
    php-mysql \
    php-opcache \
    php-soap \
    php-xml \
    php-xsl \
    php-zip \
    && apt-get clean
    
# Install extra utils
RUN curl -sS https://getcomposer.org/installer | php -- --1
RUN mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer
