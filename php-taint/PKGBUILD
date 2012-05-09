# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-taint
pkgver=0.5.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='extension used for detecting XSS codes(tainted string)'
url='http://pecl.php.net/package/taint'
license=('PHP')
source=("http://pecl.php.net/get/taint-${pkgver}.tgz")
depends=('php')
backup=('etc/php/conf.d/taint.ini')
md5sums=('96fb2f9463fe4a985e80c403970d7184')

build() {
	cd ${srcdir}/taint-${pkgver}
	phpize
	./configure --prefix=/usr --enable-taint
	make
}

# check() {
# 	cd ${srcdir}/taint-${pkgver}
# 	make test
# }

package() {
	cd ${srcdir}/taint-${pkgver}
	make INSTALL_ROOT=${pkgdir} install
	echo ';extension=taint.so' > taint.ini
	install -D -m644 taint.ini $pkgdir/etc/php/conf.d/taint.ini
}
