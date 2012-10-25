# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-qttools-git
pkgver=20121023
pkgrel=1
pkgdesc="Qt 5: qttools module"
groups=('qt5' 'qt5-addons')
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qttools"
license=('LGPL')
#depends=('qt5-qtbase-git' 'qt5-qtxmlpatterns-git' 'qt5-qtdeclarative-git' 'qt5-qtjsbackend-git' 'qt5-qtwebkit-git')
depends=('qt5-qtbase-git' 'qt5-qtxmlpatterns-git' 'qt5-qtdeclarative-git' 'qt5-qtjsbackend-git')
makedepends=('git')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://gitorious.org/qt/qttools.git"
_gitname=qt5-qttools

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
