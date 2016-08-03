FROM apifocal/supervisord:latest
MAINTAINER Alexandru Zbarcea <alexz@apache.org>

# Install packages, download files ...
ADD docker-apt-php5.list /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    APT_ALL_REPOS=1 docker-apt apache2 libapache2-mod-fastcgi php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml

# Configure: hello
ADD hello.* /var/www/hello/
RUN chown --recursive root:root /var/www/hello

# Configure: httpd
ADD default.apache2 /etc/apache2/sites-available/000-default.conf
RUN a2enmod actions cgid

#TODO: add support for php-fastcgi

# Configure: supervisor
ADD supervisord.apache2.conf /etc/supervisor/conf.d/apache2.conf
ADD supervisord.php.conf /etc/supervisor/conf.d/php.conf

EXPOSE 80/tcp
