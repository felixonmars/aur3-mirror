# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-qtpim-git
pkgver=20121107
pkgrel=1
pkgdesc="Qt 5: qtpim module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtpim"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtdeclarative-git')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtpim.git"
_gitname=qt5-qtpim

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone --depth 1 ${_gitroot} ${_gitname} && cd ${_gitname}
	else
		cd ${_gitname} && git reset --hard && git pull origin && git clean -dfx
	fi

	msg "GIT checkout done."

	/opt/qt5/bin/qmake
	make
}

package() {
	cd "${_gitname}"

	make INSTALL_ROOT="${pkgdir}" install
}
