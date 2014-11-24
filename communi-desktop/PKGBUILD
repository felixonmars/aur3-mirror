# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=communi-desktop
pkgver=3.2.0
pkgrel=1
pkgdesc="Communi for desktop"
arch=('i686' 'x86_64')
url="http://communi.github.io/"
license=('GPL2')
depends=('libcommuni')
makedepends=('git' 'qtchooser')

build() {
	export QT_SELECT=5

	git clone -b v3.2.0 https://github.com/communi/communi-desktop.git
	cd communi-desktop
	git submodule update --init

	qmake
	make
}

package() {
	cd communi-desktop
	make INSTALL_ROOT="${pkgdir}" install
}
