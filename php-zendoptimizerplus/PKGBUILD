# $Id: PKGBUILD 356 2013-04-12 08:59:33Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-zendoptimizerplus
pkgver=7.0.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='The Zend Optimizer+ provides faster PHP execution through opcode caching and optimization.'
url='https://github.com/zend-dev/ZendOptimizerPlus'
depends=('php')
license=('PHP')
source=("zendoptimizerplus-${pkgver}.tgz::https://github.com/zend-dev/ZendOptimizerPlus/archive/v${pkgver}.tar.gz")
backup=('etc/php/conf.d/zendoptimizerplus.ini')
md5sums=('c5d41c2404916e5aaceff5c7f7d887ce')

build() {
	cd $srcdir/ZendOptimizerPlus-$pkgver
	phpize
	./configure --prefix=/usr
	make
}

# check() {
# 	cd $srcdir/ZendOptimizerPlus-$pkgver
# 	make test
# }

package() {
	cd $srcdir/ZendOptimizerPlus-$pkgver
	make INSTALL_ROOT=$pkgdir install
	echo ';zend_extension=/usr/lib/php/modules/opcache.so' > zendoptimizerplus.ini
	install -D -m644 zendoptimizerplus.ini $pkgdir/etc/php/conf.d/zendoptimizerplus.ini
	install -D -m644 README $pkgdir/usr/share/doc/php-zendoptimizerplus/README
}
