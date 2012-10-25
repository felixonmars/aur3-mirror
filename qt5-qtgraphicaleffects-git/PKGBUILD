# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-qtgraphicaleffects-git
pkgver=20121023
pkgrel=1
pkgdesc="Qt 5: qtgraphicaleffects module (QtQuick 2 Graphical Effects)"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtgraphicaleffects"
license=('LGPL')
depends=('qt5-qtdeclarative-git')
makedepends=('gcc' 'git')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtgraphicaleffects.git"
_gitname=qt5-qtgraphicaleffects

build() {
	if [ ! -d "${_gitname}" ]; then
		git clone ${_gitroot} ${_gitname} && cd ${_gitname}
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
