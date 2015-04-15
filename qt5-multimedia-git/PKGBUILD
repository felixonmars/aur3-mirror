# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-multimedia
pkgname=$_pkgname-git
pkgver=v5.5.0.alpha1.28.g6187b72
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtMultimedia)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-base-git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitorious.org/qt/qtmultimedia.git#branch=5.5")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	qmake "$srcdir/$_pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
