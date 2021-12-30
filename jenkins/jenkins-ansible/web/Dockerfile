FROM remote-host

RUN dnf -y install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf -y install nginx openssl
RUN dnf -y module enable php:remi-8.0 && \
    dnf -y install \
    php \
    php-opcache \
    php-gd \
    php-curl \
    php-mysqlnd \
    php-fpm \
    php-soap \
    php-xml \
    php-zip \
    php-json \
    php-mcrypt \
    php-mbstring

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN mkdir /run/php-fpm
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
