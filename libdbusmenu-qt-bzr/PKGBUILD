pkgname=libdbusmenu-qt-bzr
_bzrmod=libdbusmenu-qt
pkgver=243
pkgrel=1
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec"
arch=('i686' 'x86_64')
url="https://launchpad.net/libdbusmenu-qt"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'bzr' 'doxygen')
conflicts=('libdbusmenu-qt')
provides=('libdbusmenu-qt')
groups=('kde-git')
source=('libdbusmenu-qt::bzr+http://bazaar.launchpad.net/~dbusmenu-team/libdbusmenu-qt/trunk/')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_bzrmod
  bzr revno
}

build() {
  cd $srcdir
  if [[ -d $srcdir/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf $srcdir/build 
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $srcdir/$_bzrmod -DCMAKE_BUILD_TYPE=debugfull \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DUSE_QT4=true
  make
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
