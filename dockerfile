FROM ubuntu:20.04

LABEL maintainer="guilherme_lol75@hotmail.com"
LABEL description="Apache / PHP development environment"

ARG DEBIAN_FRONTEND=newt
RUN apt-get update && apt-get install -y lsb-release && apt-get clean all
RUN apt install ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php

RUN apt-get -y update && apt-get install -y \
apache2 \
php8.0 \
libapache2-mod-php8.0 \
php8.0-bcmath \
php8.0-gd \
php8.0-sqlite \
php8.0-mysql \
php8.0-curl \
php8.0-xml \
php8.0-mbstring \
php8.0-zip \
mcrypt \
nano

RUN apt-get install locales
RUN locale-gen fr_FR.UTF-8
RUN locale-gen en_US.UTF-8
RUN locale-gen de_DE.UTF-8

# config PHP

RUN sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' /etc/php/8.0/apache2/php.ini
RUN sed -i -e 's/^display_errors\s*=.*/display_errors = On/' /etc/php/8.0/apache2/php.ini
RUN sed -i -e 's/^zlib.output_compression\s*=.*/zlib.output_compression = Off/' /etc/php/8.0/apache2/php.ini

ENV TERM xterm

# Apache conf
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# autorise .htaccess files
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

RUN chgrp -R www-data /var/www
RUN find /var/www -type d -exec chmod 775 {} +
RUN find /var/www -type f -exec chmod 664 {} +

EXPOSE 80

# start Apache2 on image start
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]