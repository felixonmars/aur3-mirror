# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=qt4-solutions-git
pkgver=31
pkgrel=1
epoch=1
pkgdesc="Components from the discontinued Qt Solutions product, a collection of minor Qt add-ons and former Qt modules which for various reasons have been pruned from Qt itself"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt-solutions"
license=('LGPL')
makedepends=('git')
source=(git://gitorious.org/qt-solutions/qt-solutions.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/qt-solutions"
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/qt-solutions/qtservice"
  ./configure -library
  qmake-qt4
  make

  cd "$srcdir/qt-solutions/qtsingleapplication"
  ./configure -library
  qmake-qt4
  make
}

package() {
  mkdir -p "$pkgdir/usr/include"

  cd "$srcdir/qt-solutions/qtservice/src"
  cp QtServiceBase QtServiceController qtservice.h "$pkgdir/usr/include/"
  cp -r ../lib "$pkgdir/usr/"

  cd "$srcdir/qt-solutions/qtsingleapplication/src"
  cp QtSingleApplication qtsingleapplication.h "$pkgdir/usr/include/"
  cp -r ../lib "$pkgdir/usr/"
}

# vim:set ts=2 sw=2 et:
