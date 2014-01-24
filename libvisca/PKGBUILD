# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libvisca
pkgver=1.1.0
pkgrel=1
pkgdesc='A library for controlling a VISCA(tm) compliant camera'
arch=('i686' 'x86_64')
url="http://damien.douxchamps.net/libvisca/"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/libvisca/libvisca/${pkgver}/libvisca-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/libvisca-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/libvisca-${pkgver}"
	make DESTDIR="$pkgdir" install
}

md5sums=('98a2ee940091dcf25c9af89e55518890')
