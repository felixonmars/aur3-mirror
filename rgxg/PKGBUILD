# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=rgxg
pkgver=0.1
pkgrel=1
pkgdesc='A command-line tool to generate (extended) regular expressions'
arch=('i686' 'x86_64')
url="http://rgxg.sourceforge.net/"
license=('zlib')
source=("http://downloads.sourceforge.net/project/rgxg/rgxg/rgxg-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/rgxg-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/rgxg-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('81f558933922a9973ec57ae444ad8f34')
