# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=ihex2bin
pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='Converts intel hex to binary'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/ihex2bin'
source=("https://github.com/KnightOS/ihex2bin/archive/${pkgver}.tar.gz")
sha1sums=('0ea6fdf546c557bc906f0c58a056b7c20e9e783f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
