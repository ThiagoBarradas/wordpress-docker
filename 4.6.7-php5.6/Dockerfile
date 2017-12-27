FROM thiagobarradas/lamp:php-5.6
MAINTAINER Thiago Barradas <th.barradas@gmail.com>

# VARIABLES
ENV WORDPRESS_VERSION=4.6.7
ENV ADMIN_USERNAME="admin" 
ENV ADMIN_EMAIL="admin-wordpress@mailinator.com" 
ENV ADMIN_PASSWORD="Mudar123"

# GET WORDPRESS FILES
WORKDIR /var/www/html
RUN rm -f * && mkdir tmp
WORKDIR /var/www/html/tmp
RUN ls -l
RUN wget -O wordpress-$WORDPRESS_VERSION.zip https://codeload.github.com/wordpress/wordpress/zip/$WORDPRESS_VERSION
RUN chmod -R 755 /app

# UNZIP WORDPRESS
RUN unzip wordpress-$WORDPRESS_VERSION.zip
RUN ls 
RUN cp -a /var/www/html/tmp/WordPress-$WORDPRESS_VERSION/. /var/www/html

# INSTALL WP-CLI
WORKDIR /home
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp --info

# CLEAN TMP FILES
WORKDIR /var/www/html
RUN rm -rf tmp && rm -rf /home/*
RUN apt purge && apt-get autoremove -y && apt-get clean

# COPY SCRIPT TO SETUP WORDPRESS
COPY scripts/supervisord-zwordpress.conf /etc/supervisor/conf.d/supervisord-zwordpress.conf
COPY scripts/setup-wordpress.sh /setup-wordpress.sh

# EXPOSE AND RUN
RUN chmod -R 777 /var/www/html
WORKDIR /var/www/html
EXPOSE 80 3306
CMD ["/run.sh"]