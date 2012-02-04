# Maintainer: F0ruD <fzerorubigd at gmail dot com>
pkgname=zsce-phpmyadmin
pkgver=3.4.7.1
pkgrel=1
pkgdesc="phpmyadmin for zend server ce"
arch=('any')
url="http://www.phpmyadmin.net/home_page/"
license=('gpl')
provides=('phpmyadmin')
depends=('zsce-core') 
makedepends=() 

md5sums=('726df0e9ef918f9433364744141f67a8'
         'a5d3c9f6a9e5774e5b20e5c4d07f9c74')

source=(http://downloads.sourceforge.net/phpmyadmin/phpMyAdmin-${pkgver}-all-languages.tar.gz
	zsce-phpmyadmin.html)
install=$pkgname.install
conflicts=()
build() {
	mkdir ${pkgdir}/opt/
	mkdir ${pkgdir}/opt/zend/
	cp ${srcdir}/zsce-phpmyadmin.html ${pkgdir}/opt/zend/
	mkdir ${pkgdir}/opt/zend/phpmyadmin/
	cp -R ${srcdir}/phpMyAdmin-${pkgver}-all-languages/* ${pkgdir}/opt/zend/phpmyadmin	
	mkdir  ${pkgdir}/opt/zend/apache2/
	mkdir  ${pkgdir}/opt/zend/apache2/conf.d
	echo -e 'Alias /phpmyadmin "/opt/zend/phpmyadmin"' >  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '<Directory "/opt/zend/phpmyadmin">' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '\tAllowOverride All' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '\tOptions FollowSymlinks' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '\tOrder allow,deny' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '\tAllow from all' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
	echo -e '</Directory>' >>  ${pkgdir}/opt/zend/apache2/conf.d/http-phpmyadmin
}

