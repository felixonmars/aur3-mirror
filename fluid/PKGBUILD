# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=fluid
pkgver=0.2.0
pkgrel=1
pkgdesc="Fluid modules for QtQuick applications"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('LGPL2.1')
depends=('qt5-quickcontrols')
makedepends=('gdb' 'cmake')
options=('debug')
source=("http://sourceforge.net/projects/mauios/files/hawaii/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('63b016ba06ba946a0e4a67ab5e62dad2')

prepare() {
	cd ${pkgname}-${pkgver}
	mkdir -p build
}

build() {
	export QT_SELECT=5

	cd ${pkgname}-${pkgver}/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="${pkgdir}" install
}
