# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=mdds
pkgver=0.10.2
pkgrel=1
pkgdesc="A collection of multi-dimensional data structures and indexing algorithms"
arch=('any')
url="http://code.google.com/p/multidimalgorithm/"
license=('MIT')
source=("http://kohei.us/files/mdds/src/mdds_${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/mdds_${pkgver}"
	./configure --prefix=/usr
}

package() {
	cd "${srcdir}/mdds_${pkgver}"
	make DESTDIR="${pkgdir}" install
	
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('47203e7cade74e5c385aa812f21e7932')
