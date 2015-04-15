# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-quick1-git
pkgver=v5.5.0.alpha1.5.g15daa5f
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtDeclarative)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-script' 'mesa')
provides=('qt5-quick1')
conflicts=('qt5-quick1')
makedepends=('git')
source=("git+https://gitorious.org/qt/qtquick1.git#branch=5.5")
sha256sums=('SKIP')
_gitname='qtquick1'

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	qmake
	make
}

package() {
	cd "$srcdir/$_gitname"
	make INSTALL_ROOT="${pkgdir}" install
}
