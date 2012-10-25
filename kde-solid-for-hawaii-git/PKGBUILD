# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=kde-solid-for-hawaii-git
pkgver=20121025
pkgrel=1
pkgdesc="Hawaii: Solid from KDE"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('LGPL')
depends=('qt5-qtbase-for-hawaii-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-qtsvg-git')
provides=('kde-solid-git')
conflicts=('kde-solid-git')
source=()
md5sums=()

_gitroot="git://github.com/hawaii-desktop/solid.git"
_gitname=solid
_gitbranch=hawaii

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	git checkout $_gitbranch

	msg "GIT checkout done."

	export PATH=/opt/qt5/bin:$PATH

	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/opt/hawaiide -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	export PATH=/opt/qt5/bin:$PATH

	cd "${_gitname}/build"
	make DESTDIR="${pkgdir}" install
}
