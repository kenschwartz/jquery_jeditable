# serve the demo page of jquery-jeditable
# https://github.com/NicolasCARPi/jquery_jeditable

# use apache + php
FROM php:7.2.1-apache-stretch

# select version or branch here
ENV JEDITABLE_VERSION master

LABEL org.label-schema.name="jquery-jeditable demo" \
    org.label-schema.description="Run Apache and php to serve jquery-jeditable demo page" \
    org.label-schema.url="https://jeditable.elabftw.net" \
    org.label-schema.vcs-url="https://github.com/NicolasCARPi/jquery_jeditable" \
    org.label-schema.version=$JEDITABLE_VERSION\
    org.label-schema.maintainer="nicolas.carpi@curie.fr" \
    org.label-schema.schema-version="1.0"

COPY . /var/www/html
RUN ln -s /var/www/html/src /var/www/html/demos/src
RUN sed -i -e "s:/var/www/html:/var/www/html/demos:" /etc/apache2/sites-enabled/000-default.conf
