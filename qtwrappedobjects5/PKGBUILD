# Contributor: Sandro Andrade <sandroandrade at kde.org>
pkgname=qtwrappedobjects5
pkgver=0.89
pkgrel=0
pkgdesc="QtWrappedObjects is a library for easily handling of wrapped objects by means of smart delegators"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt/qtmodeling"
license=('LGPL')
depends=('qt5-base' 'qt5-script')
source=(http://qt.gitorious.org/qt/qtmodeling/archive-tarball/d3c52833)
 
build() {
  cd $srcdir/qt-qtmodeling/
  qmake-qt5 -r
 
  cd $srcdir/qt-qtmodeling/src/wrappedobjects/
 
  make || return 1
  cd $srcdir/qt-qtmodeling/src/wrappedobjectswidgets/
 
  make || return 1
}
 
package() {
  cd $srcdir/qt-qtmodeling/src/wrappedobjects/
  make INSTALL_ROOT=${pkgdir} install
  cd $srcdir/qt-qtmodeling/src/wrappedobjectswidgets/
  make INSTALL_ROOT=${pkgdir} install
}
 
md5sums=('c7ebf7b8cc1f5d1b8198341f662555d9')
