# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Ivan Petruk <localizator at ukr dot net>

_pkgname=qt5-translations
pkgname=$_pkgname-git
pkgver=v5.5.0.alpha1.8.g8eb8dcb
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Translations)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-base-git")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitorious.org/qt/qttranslations.git#branch=5.5")
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
