# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=vistaio
pkgver=1.2.16
pkgrel=1
pkgdesc='Library for loading and storing various types of binary data'
arch=('i686' 'x86_64')
url="http://mia.sourceforge.net/"
license=('custom')
depends=('glibc')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/mia/vistaio/vistaio-${pkgver}.tar.xz")

build() {
	cd "${srcdir}/vistaio-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/vistaio-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('aa41955e8f701b9304f4804861f09c05')
