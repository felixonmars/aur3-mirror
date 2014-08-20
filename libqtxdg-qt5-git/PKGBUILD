# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=libqtxdg
pkgname=$_pkgname-qt5-git
pkgver=0.5.3.30.gf0c73ca
pkgrel=1
pkgdesc="Library providing freedesktop.org specs implementations for Qt."
arch=("i686" "x86_64" "armv6h")
url="http://lxqt.org"
license=("GPL2")
depends=("qt5-base" "qt5-tools")
makedepends=("git" "cmake")
provides=("$_pkgname-qt5")
conflicts=("$_pkgname-qt5")
source=("git://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT5=true ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make DESTDIR="$pkgdir" install
}
