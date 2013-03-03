# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qcheckers
pkgver=20091230
pkgrel=1
pkgdesc="Qt Russian(8x8) and International(10x10) checkers game"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qcheckers/"
license=('GPL3')
depends=('qt4')
source=(http://qcheckers.googlecode.com/files/QCheckers-$pkgver.tar.gz)
md5sums=('f347cb93a95df58ffcf80b84c978af6e')

build() {
  cd $srcdir/QCheckers

  qmake-qt4
  make
}

package() {
  cd $srcdir/QCheckers

  install -Dm755 QCheckers $pkgdir/usr/bin/qcheckers
}
