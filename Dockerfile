FROM docker-registry.wikimedia.org/dev/stretch-php72-fpm-apache2:0.0.4

RUN printf 'opcache.enable=1\nopcache.validate_timestamps=1\nopcache.revalidate_freq=10' > /etc/php/7.2/fpm/conf.d/99-T236104.ini
