# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
pkgname=libqglviewer-qt3
pkgver=2.2.6.3
pkgrel=1
pkgdesc="C++ library based on Qt that eases the creation of OpenGL 3D viewers"
arch=('i686' 'x86_64')
url="http://artis.imag.fr/Members/Gilles.Debunne/QGLViewer/"
license=('GPL')
depends=('qt3' 'mesa')
provides=(libqglviewer)
conflicts=(libqglviewer)
source=(http://artis.imag.fr/Members/Gilles.Debunne/QGLViewer/src/libQGLViewer-2.2.6-3.tar.gz
        includes.patch)
md5sums=('14ae14cd9914679f1a3e63feaa390c26'
         '34a5628ea6a41e1ce3ae1550f2f7e2ae')
build() {
  export QTDIR=/opt/qt
  export QMAKESPEC=/opt/qt/mkspecs/linux-g++
  cd "$srcdir/libQGLViewer-2.2.6-3/QGLViewer"
  patch -p1 < "$srcdir/includes.patch"
  /opt/qt/bin/qmake PREFIX=/opt/qt || return 1
  sed -i 's/Makefile.Release/Makefile/' Makefile
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
}
