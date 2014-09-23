# Maintainer: Daniel Kirchner <daniel@ekpyron.org>

_pkgname=qtmimetypes
pkgname=$_pkgname-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Mimetype library for Qt4."
arch=("i686" "x86_64" "armv6h")
url="https://qt.gitorious.org/"
license=("GPL2")
depends=("qt4")
makedepends=("git" "cmake")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://gitorious.org/qtplayground/mimetypes.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/mimetypes"
    rm -rf build
	mkdir -p build
	cd build
    qmake-qt4 ..
	make
}

package() {
	cd "$srcdir/mimetypes"
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
