# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-imageformats
pkgname=$_pkgname-git
pkgver=v5.5.0.alpha1.1.g32e437b
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Images plugins)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-base-git" "libtiff")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitorious.org/qt/qtimageformats.git#branch=5.5")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	qmake ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
