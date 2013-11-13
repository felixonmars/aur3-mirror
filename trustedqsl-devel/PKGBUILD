# Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
pkgname=trustedqsl-devel
pkgver=2.0
pkgrel=2
epoch=
pkgdesc="TrustedQSL - Logbook of the World, development version"
arch=('x86_64' 'i686')
url="http://lotw.arrl.org/"
license=('ARRL')
provides=('trustedqsl')
groups=()
depends=(openssl expat zlib wxgtk curl)
makedepends=(openssl expat zlib wxgtk curl cmake)
source=(http://sourceforge.net/projects/trustedqsl/files/TrustedQSL/v${pkgver}/tqsl-${pkgver}.tgz)
md5sums=('6ab8255aec7b061bc224a48bd4cbd58d')
sha1sums=('c132d83bb7bd2e805fe9d6df52ea235d55153153')

build() {
	cd "$srcdir/tqsl-${pkgver}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "$srcdir/tqsl-${pkgver}/build"
	make DESTDIR="$pkgdir/" install
}
