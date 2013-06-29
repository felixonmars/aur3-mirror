# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=dfbterm
pkgver=0.8.15
pkgrel=4
pkgdesc="Terminal emulator for directfb"
arch=(armv7h i686 x86_64)
url="http://www.directfb.org"
license="LGPL"
depends=('lite')
source=(http://www.directfb.org/downloads/Programs/DFBTerm-${pkgver}.tar.gz)
md5sums=('0e554bbb65052289d01415f7042d72d2')
build () {
	cd ${srcdir}/DFBTerm-${pkgver}
	./configure --prefix=/usr
	make || return 1
}
package() {
	cd ${srcdir}/DFBTerm-${pkgver}
	make DESTDIR="${pkgdir}" install
}
