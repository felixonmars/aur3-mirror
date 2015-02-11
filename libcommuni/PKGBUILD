# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=libcommuni
pkgver=3.3.0
pkgrel=1
pkgdesc="A cross-platform IRC framework written with Qt"
arch=('i686' 'x86_64')
url="http://communi.github.io/"
license=('BSD')
depends=('qt5-base')
makedepends=('qtchooser')
source=('https://github.com/communi/libcommuni/archive/v3.3.0.zip')
md5sums=('0dba63bc138c8675e75713e76e05eed5')

build() {
	export QT_SELECT=5

	cd ${pkgname}-${pkgver}

	./configure \
		-prefix /usr \
		-headerdir /usr/include \
		-featuredir /usr/lib/qt/mkspecs/features
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make INSTALL_ROOT="${pkgdir}" install
}
