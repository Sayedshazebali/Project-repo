FROM php:8.0-alpine
#RUN set -ex \
#    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
#    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
#    && pecl install imagick-3.4.3 \
#    && docker-php-ext-enable imagick \
#    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
#    && apk del .phpize-deps
#RUN #apk add libpng libpng-dev libjpeg-turbo-dev oniguruma oniguruma-dev icu icu-dev libxml2 libxml2-dev bzip2 bzip2-dev composer



#RUN docker-php-ext-install tokenizer xml bz2 bcmath json mysqli
#RUN docker-php-ext-enable tokenizer xml bcmath pdo pdo_mysql json mysqli
#    && pecl install imagick \
#    && docker-php-ext-enable imagick \
#    && apk del autoconf g++ libtool make pcre-dev



WORKDIR /app
COPY . /app
RUN mv .env.example .env
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer install
#RUN composer install --ignore-platform-req=ext-dom --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-sodium --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-dom --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-imagick --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-gd --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-xml --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-simplexml --ignore-platform-req=ext-xmlreader
#ENTRYPOINT ["/usr/bin/php","artisan serve"]
RUN php artisan key:generate && php artisan cache:clear
EXPOSE 8000
RUN php artisan config:clear
CMD php artisan serve --host 0.0.0.0 --port 8000
