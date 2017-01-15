FROM php:5.6-apache
Maintainer Alexander Rabenstein <alexander@die-rabensteins.de>

run apt-get update
run apt-get install apt-utils -y
run apt-get install git-core -y  
run apt-get install libpng12-dev libsqlite3-dev sqlite3 php5-sqlite php5-gd -y && docker-php-ext-install -j$(nproc) pdo_sqlite  gd

RUN git clone https://github.com/rvolz/BicBucStriim /var/www/html
run chmod -R ga+w /var/www/html/data
add sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
add git.sh /opt/git.sh
add php.ini /usr/local/etc/php/
RUN  /opt/git.sh /var/www/html
run a2enmod rewrite
# Enable Debug Mode
RUN   sed -i "s|'mode' => 'production',|'mode' => 'debug', |g" /var/www/html/index.php
VOLUME ["/library"]

expose 8080 
