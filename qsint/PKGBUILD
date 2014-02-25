# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=qsint
pkgver=0.2.2
pkgrel=2
pkgdesc="Opensource collection of Qt widgets."
license=('LGPL')
arch=('i686' 'x86_64')
url="http://sintegrial.com/qsint/pages/en/"
depends=('qt4')
makedepends=('gcc' 'qt4')
options=()
source=("http://sintegrial.com/files/qsint-${pkgver}-src.zip")
md5sums=('5adb14abc517aea47f861a4e85bc51a2')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-src"
  sed -i "1i#include <cmath>" examples/Core/scrollpanner/mainwindow.cpp
  sed -i "s|staticlib|shared|g" src/src.pri
  qmake-qt4 .
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-src"
  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir"/usr/include/qsint/{Core,Charts}
  install -d "$pkgdir"/usr/lib
  install -m755 "$srcdir"/${pkgname}-${pkgver}-src/lib/*.so* "$pkgdir"/usr/lib
  install -m644 "$srcdir"/${pkgname}-${pkgver}-src/src/Core/*.h "$pkgdir"/usr/include/qsint/Core
  install -m644 "$srcdir"/${pkgname}-${pkgver}-src/src/Charts/*.h "$pkgdir"/usr/include/qsint/Charts
}
