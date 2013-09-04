# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-jsbackend-git
pkgver=v5.1.1.2.g0a8af38
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtV8)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-base')
makedepends=('git')
provides=('qt5-jsbackend')
conflicts=('qt5-jsbackend')
source=("git://gitorious.org/qt/qtjsbackend.git#branch=stable")
sha256sums=('SKIP')
_gitname='qtjsbackend'

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	qmake
	make -j8
}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="$pkgdir" install
}
