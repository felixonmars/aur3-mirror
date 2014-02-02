# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=kyfd
pkgver=0.0.5
pkgrel=1
pkgdesc='A general-purpose beam-search decoder for WFST-based data processing'
arch=('i686' 'x86_64')
url="http://www.phontron.com/kyfd/"
license=('Apache')
depends=('openfst' 'xerces-c')
source=("http://www.phontron.com/kyfd/download/kyfd-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/kyfd-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/kyfd-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('19870d9d1067ea23a6ec1155d2f096b3')
