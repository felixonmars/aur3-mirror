# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Ivan Petruk <localizator at ukr dot net>

_pkgname=qt5-enginio
pkgname=$_pkgname-git
pkgver=v1.1.1.12.gefac3cd
pkgrel=1
pkgdesc="A Backend-as-a-Service solution to ease the backend development for connected and data-driven application"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-declarative-git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitorious.org/qt/qtenginio.git")
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
