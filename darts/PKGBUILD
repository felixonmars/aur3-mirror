# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=darts
pkgver=0.32
pkgrel=1
pkgdesc='C++ Template Library for implementation of Double-Array'
arch=('i686' 'x86_64')
url="http://chasen.org/~taku/software/darts/"
license=('LGPL' 'BSD')
depends=('gcc-libs')
source=("http://chasen.org/~taku/software/darts/src/${pkgname}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --libexecdir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 BSD "${pkgdir}/usr/share/licenses/${pkgname}/BSD"
}

md5sums=('2149e32b8e33cf38864f7fc25a6532fb')
