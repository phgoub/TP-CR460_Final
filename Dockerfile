# Base image version
FROM ubuntu:16.04

#Apache Install
RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php php-mysql gettext-base
RUN a2enmod php7.0


# Wordpress add
ADD wordpress/ /var/www/html/wordpress
RUN a2enmod php7.0
RUN chmod 0777 /var/www/html/wordpress
ADD wp-config.php-template /var/www/html/wordpress
ADD entrypoint.sh /

# Command identifier
ENTRYPOINT  ["/bin/bash", "/entrypoint.sh"]
EXPOSE 80