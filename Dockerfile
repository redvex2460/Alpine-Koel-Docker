FROM alpine
RUN mkdir -p /var/www/koel
RUN apk update \
    && apk add git sqlite yarn composer \
    openssl php7-exif php7-session php7-fileinfo \
    php7-simplexml php7-pdo php7-curl php7-zip php7-tokenizer \
    php7-dom php7-xmlwriter php7-xml php7-sqlite3 php7-pdo_sqlite \
    libpng-dev bash g++ make zlib-dev npm
WORKDIR /var/www/koel
RUN composer global require laravel/installer
RUN git clone --recursive https://github.com/koel/koel.git .
COPY koel-init.sh /
RUN chmod +x /koel-init.sh
CMD /koel-init.sh