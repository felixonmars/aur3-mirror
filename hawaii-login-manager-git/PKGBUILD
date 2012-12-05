# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-login-manager-git
pkgver=20121204
pkgrel=1
pkgdesc="Hawaii: Login Manager"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL')
depends=('hawaii-fluid-git')
makedepends=('git' 'cmake')
source=()
md5sums=()

_gitroot="git://github.com/hawaii-desktop/login-manager.git"
_gitname=login-manager

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

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
