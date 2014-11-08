# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-x11extras
pkgname=$_pkgname-git
pkgver=v5.4.0.beta1.3.gd8d6919
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtX11Extras)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-base-git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://gitorious.org/qt/qtx11extras.git#branch=dev")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

prepare() {
	mkdir -p build
	cd build
	qmake "$srcdir/$_pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
