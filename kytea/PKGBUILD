# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=kytea
pkgver=0.4.7
pkgrel=1
pkgdesc='A general toolkit developed for analyzing text'
arch=('i686' 'x86_64')
url="http://www.phontron.com/kytea/"
license=('Apache')
depends=('gcc-libs')
source=("http://www.phontron.com/kytea/download/kytea-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/kytea-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/kytea-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('472fa47eb9fe79311ba42d69d566174c')
