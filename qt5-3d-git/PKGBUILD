# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-3d-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Qt3D)"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-base-git' 'qt5-declarative-git')
makedepends=('git')
replaces=('qt5-qt3d-git')
conflicts=('qt5-3d')
provides=('qt5-3d')
options=('!libtool')
_gitroot="git://gitorious.org/qt/qt3d.git"
_gitname="qt5-3d"
_gitbranch=master
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ${srcdir}/${_gitname}
	qmake
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make INSTALL_ROOT="${pkgdir}" install
}
