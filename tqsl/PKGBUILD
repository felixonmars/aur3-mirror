# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Wijnand Modderman-Lenstra <maze@maze.io>
pkgname=tqsl
pkgver=1.14.3
pkgrel=1
epoch=
pkgdesc="TrustedQSL - Logbook of the World"
arch=('x86_64' 'i686')
url="http://lotw.arrl.org/"
license=('ARRL')
groups=()
depends=(openssl expat zlib wxgtk curl)
makedepends=(openssl expat zlib wxgtk curl cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-1.14.3.tgz)
md5sums=('9f9317de671e9d8b5e71d883a5983135')
sha1sums=('9a79bd5f5274145ac99c38922a5ba1c27e6a6fe8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
