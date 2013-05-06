# Contributor: Sandro Andrade <sandroandrade at kde.org>
pkgname=qtmof5
pkgver=0.89
pkgrel=0
pkgdesc="QtMof is a Qt5-based implementation of OMG's MOF (Meta Object Facility) specification"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt/qtmodeling"
license=('LGPL')
depends=('qtwrappedobjects5')
source=(http://qt.gitorious.org/qt/qtmodeling/archive-tarball/d3c52833)
 
build() {
  cd $srcdir/qt-qtmodeling/
  qmake-qt5 -r
 
  cd $srcdir/qt-qtmodeling/src/mof/
  make || return 1
 
  cd $srcdir/qt-qtmodeling/src/plugins/metamodels/mof/
  make || return 1
}
 
package() {
  cd $srcdir/qt-qtmodeling/src/mof/
  make INSTALL_ROOT=${pkgdir} install
 
  cd $srcdir/qt-qtmodeling/src/plugins/metamodels/mof/
  make INSTALL_ROOT=${pkgdir} install
}
 
md5sums=('c7ebf7b8cc1f5d1b8198341f662555d9')
