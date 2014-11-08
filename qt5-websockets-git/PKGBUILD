# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qt5-websockets
pkgname=$_pkgname-git
pkgver=v5.3.2.4.g7aeea58
pkgrel=1
pkgdesc="A RFC6455-compliant WebSockets client and server implementation in Qt"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("LGPL")
depends=("qt5-base")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://gitorious.org/qt/qtwebsockets.git")
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
