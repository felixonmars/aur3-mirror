# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-jsondb-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtJsonDb)"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('libedit' 'qt5-base-git' 'qt5-declarative-git')
makedepends=('git')
replaces=('qt5-qtjsondb-git')
provides=('qt5-jsondb')
conflicts=('qt5-jsondb')
options=('!libtool')
_gitroot="git://gitorious.org/qt/qtjsondb.git"
_gitname="qt5-jsondb"
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
