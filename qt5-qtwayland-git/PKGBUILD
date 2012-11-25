# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-qtwayland-git
pkgver=20121105
pkgrel=1
pkgdesc="Qt 5: qtwayland module"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtwayland"
license=('LGPL')
depends=('qt5-qtbase-git' 'qt5-qtdeclarative-git' 'libxcomposite' 'libxkbcommon' 'wayland')
makedepends=('gcc' 'git')

_gitroot="git://gitorious.org/qt/qtwayland.git"
_gitname=qt5-qtwayland

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
