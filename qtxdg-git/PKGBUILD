# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtxdg-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Qt XDG"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop/qtxdg"
license=('LGPL')
depends=('qtbase-git')
makedepends=('gcc' 'git' 'qtchooser')
_gitroot="git://github.com/hawaii-desktop/qtxdg.git"
_gitname="qtxdg"
_gitbranch="master"
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	git describe --always | sed 's|-|.|g'
}

build() {
	export PKG_CONFIG_PATH=/opt/kf5/lib/pkgconfig:/opt/qt-git/lib/pkgconfig
	export LD_LIBRARY_PATH=/opt/kf5/lib:/opt/qt-git/lib
	export QT_SELECT=git

	cd ${srcdir}/${_gitname}
	qmake
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make INSTALL_ROOT="${pkgdir}" install
}
