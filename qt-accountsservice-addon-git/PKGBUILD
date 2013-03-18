# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt-accountsservice-addon-git
pkgver=20130318
pkgrel=1
pkgdesc="Qt AccountsService add-on"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop/qt-accountsservice-addon"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative')
makedepends=('gcc' 'git')
source=()
md5sums=()

_gitroot="git://github.com/hawaii-desktop/qt-accountsservice-addon.git"
_gitname=qt-accountsservice-addon

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	qmake
	make
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" install
}
