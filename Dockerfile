FROM debian:bookworm-slim  
# latest

# make sure you install supervisord
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx php8.2 \
    php8.2-ctype \
    php8.2-curl \
    php8.2-dom \
    php8.2-fileinfo \
    php8.2-fpm \
    php8.2-gd \
    php8.2-intl \
    php8.2-mbstring \
    php8.2-mysqli \
    php8.2-opcache \
    # php8.2-openssl \
    php8.2-phar \
    # php8.2-session \
    php8.2-tokenizer \
    php8.2-xml \
    php8.2-xmlreader \
    php8.2-xmlwriter \
    supervisor;


    # php8.2 php8.2-cli php8.2-{bz2,curl,mbstring,intl};
    

# do your stuff, install php, nginx, whatever do you need.
# .
# .
# after you did everything, set up supervisord

EXPOSE 8080

COPY default.conf /etc/nginx/conf.d/default.conf


# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# ENTRYPOINT nginx -c /etc/nginx/nginx.conf -g 'daemon off;'

# STOPSIGNAL SIGTERM
# CMD ["nginx", "-g", "daemon off;"]
# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
# Configure a healthcheck to validate that everything is up&running
# HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8080/fpm-ping || exit 1