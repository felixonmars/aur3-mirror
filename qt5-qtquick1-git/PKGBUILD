# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Maintainer: Sergio Correia <sergio.correia@uece.net>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=qt5-qtquick1-git
pkgver=20121101
pkgrel=1
pkgdesc="Qt 5: qtquick1 module (QtQuick 1, QML)"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtquick1"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtscript-git')
makedepends=('gcc' 'git')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qtquick1.git"
_gitname=qt5-qtquick1

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
