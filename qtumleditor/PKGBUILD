# Contributor: Sandro Andrade <sandroandrade at kde.org>
pkgname=qtumleditor
pkgver=0.89
pkgrel=0
pkgdesc="Qt5 UML Editor is a MOF/UML editor based on QtMof Qt5 add-on"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt/qtmodeling"
license=('LGPL')
depends=('qtmof5' 'qtuml5')
source=(http://qt.gitorious.org/qt/qtmodeling/archive-tarball/d3c52833)
 
build() {
  cd $srcdir/qt-qtmodeling/
  qmake-qt5 -r
 
  cd $srcdir/qt-qtmodeling/examples/uml/qtumleditor/
  make || return 1
}
 
package() {
  cd $srcdir/qt-qtmodeling/examples/uml/qtumleditor/
  make INSTALL_ROOT=${pkgdir} install
}
 
md5sums=('c7ebf7b8cc1f5d1b8198341f662555d9')
