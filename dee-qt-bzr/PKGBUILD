# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=dee-qt-bzr
_bzrname=dee-qt
pkgver=89
pkgrel=4
pkgdesc="Qt bindings for libdee"
arch=('i686' 'x86_64')
url="https://launchpad.net/dee-qt"
license=('GPL')
depends=('dee' 'qt5-base' 'qt5-quick1')
makedepends=('cmake' 'bzr')
md5sums=('SKIP')
provides=('dee-qt')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~unity-team/dee-qt/trunk/")

pkgver() {
  cd $_bzrname
  bzr revno
}

build() {
  cd "$srcdir"/$_bzrname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITHQT5=1
  make
}

package() { 
  cd ${srcdir}/$_bzrname
  make DESTDIR="${pkgdir}" install
}
