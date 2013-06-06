pkgname=php-zendopcache
pkgver=7.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='The Zend OPcache provides faster PHP execution through opcode caching and optimization.'
url='http://pecl.php.net/package/ZendOpCache'
depends=('php')
license=('PHP')
source=("http://pecl.php.net/get/zendopcache-${pkgver}.tgz" "opcache.ini")
backup=('etc/php/conf.d/opcache.ini')
md5sums=('a175166ac32544051bd3277cc00a7b5d' '674feeda538e2c56aec1d8d712512113')

build() {
	cd $srcdir/zendopcache-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/zendopcache-$pkgver
	make INSTALL_ROOT=$pkgdir install
	install -D -m644 $srcdir/opcache.ini $pkgdir/etc/php/conf.d/opcache.ini
	install -D -m644 README $pkgdir/usr/share/doc/php-zendopcache/README
}
