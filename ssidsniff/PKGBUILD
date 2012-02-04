# Maintainer: Max Roder <maxroder@web.de>

pkgname='ssidsniff'
pkgver='0.53'
pkgrel='1'
pkgdesc='A curses based tool that allows identification, classification and data capturing of wireless networks'
url='http://www.bastard.net/~kos/wifi/'
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpcap')
source=("http://www.bastard.net/~kos/wifi/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a76ae817fbb12a3a642a40d6d48fd5a5fc995962ffd076c54809f6621ffc3894')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
