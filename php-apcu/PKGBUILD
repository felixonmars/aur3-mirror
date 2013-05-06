# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=php-apcu
pkgver=4.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A free, open, and robust framework for caching'
url='http://pecl.php.net/package/APCu'
depends=('php')
license=('PHP')
source=("http://pecl.php.net/get/apcu-$pkgver.tgz")
backup=('etc/php/conf.d/apcu.ini')
md5sums=('994de4335eb2967c006aa9ca185876fa')

build() {
	cd $srcdir/apcu-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/apcu-$pkgver
	make INSTALL_ROOT=$pkgdir install
	echo ';extension=apcu.so' > apcu.ini
	install -D -m644 apcu.ini $pkgdir/etc/php/conf.d/apcu.ini
	install -D -m644 apc.php $pkgdir/usr/share/php-apcu/apc.php
	install -D -m644 INSTALL $pkgdir/usr/share/doc/php-apcu/install.txt
}
