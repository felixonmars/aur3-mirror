# $Id: PKGBUILD 135862 2011-08-19 20:05:54Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-uploadprogress
pkgver=1.0.3.1
pkgrel=0
arch=('i686' 'x86_64')
pkgdesc='A free, open, and robust framework for caching and optimizing PHP intermediate code'
url='http://pecl.php.net/package/uploadprogress'
depends=('php')
license="PHP"
source=("http://pecl.php.net/get/uploadprogress-${pkgver}.tgz")
backup=('etc/php/conf.d/uploadprogress.ini')
md5sums=('13fdc39d68e131f37c4e18c3f75aeeda')

build() {
	cd $srcdir/uploadprogress-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/uploadprogress-$pkgver
	make INSTALL_ROOT=$pkgdir install
	echo ';extension=uploadprogress.so' > uploadprogress.ini
	install -D -m644 uploadprogress.ini $pkgdir/etc/php/conf.d/uploadprogress.ini
}
