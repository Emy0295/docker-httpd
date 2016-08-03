FROM apifocal/supervisord:latest
MAINTAINER Alexandru Zbarcea <alexz@apache.org>

# Install packages, download files ...
RUN APT_ALL_REPOS=1 docker-apt apache2 libapache2-mod-fastcgi php-apc php5-cli php5-fpm

# Configure: hello
ADD hello.* /var/www/hello/
RUN chown --recursive root:root /var/www/hello

# Configure: httpd
ADD default.apache2 /etc/apache2/sites-available/000-default.conf
ADD php5-fpm.apache2 /etc/apache2/conf-available/php5-fpm.conf
RUN a2enconf php5-fpm && \
	a2enmod actions cgid

# Configure: php5-fpm
RUN sed --in-place "/cgi.fix_pathinfo=/s/^;//" /etc/php5/fpm/php.ini

# Configure: supervisor
ADD supervisord.apache2.conf /etc/supervisor/conf.d/apache2.conf
ADD supervisord.php.conf /etc/supervisor/conf.d/php.conf

EXPOSE 80/tcp
