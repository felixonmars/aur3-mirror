# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-fluid-themes-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Hawaii: Fluid themes"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL')
depends=('qt5-svg-git')
makedepends=('git' 'cmake' 'hawaii-vibe-git')
source=()
md5sums=()

_gitroot="git://github.com/hawaii-desktop/fluid-themes.git"
_gitbranch=master
_gitname=fluid-themes
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ${srcdir}/${_gitname}

	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_PLUGINSDIR=/usr/lib/hawaii/plugins \
		-DCMAKE_INSTALL_QMLDIR=/usr/lib/hawaii/qml \
		-DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd ${srcdir}/${_gitname}/build
	make DESTDIR="${pkgdir}" install
}
