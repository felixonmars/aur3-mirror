# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=fluid-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Fluid modules for QtQuick applications"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('LGPL')
depends=('qt5-declarative')
makedepends=('git' 'gdb' 'cmake')
options=('debug')

_gitroot="git://github.com/mauios/fluid.git"
_gitbranch=dev
_gitname=fluid
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	git describe --always | sed 's|-|.|g'
}

prepare() {
	mkdir -p build
}

build() {
	export QT_SELECT=5

	cd build
	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
