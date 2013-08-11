# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=kde-solid-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Hawaii: Solid from KDE"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('LGPL')
depends=('qtbase-git' 'udisks2')
makedepends=('cmake' 'extra-cmake-modules-git' 'git')
conflicts=('kde-solid-for-hawaii-git')
replaces=('kde-solid-for-hawaii-git')
_gitroot="git://github.com/hawaii-desktop/solid.git"
_gitname=solid
_gitbranch=hawaii
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	mkdir -p build
}

build() {
	export PKG_CONFIG_PATH=/opt/qt-git/lib/pkgconfig
	export LD_LIBRARY_PATH=/opt/qt-git/lib
	export QT_SELECT=git

	cd build
	cmake ../solid \
		-DCMAKE_INSTALL_PREFIX=/opt/hawaii-git \
		-DCMAKE_PREFIX_PATH=/opt/qt-git/lib/cmake \
		-DLIB_INSTALL_DIR=/opt/hawaii-git/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DWITH_SOLID_UDISKS2=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
