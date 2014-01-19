# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kaptain
pkgver=0.73
pkgrel=2
pkgdesc="Universal graphical front-end for command line programs"
arch=('i686' 'x86_64')
url="http://kaptain.sourceforge.net/"
license=('GPL2')
depends=('qt4')
source=(http://downloads.sourceforge.net/project/kaptain/kaptain/$pkgver/kaptain-$pkgver.tgz)
md5sums=('480cbb45356c1630a79a5aeb5721a3f2')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4 PREFIX=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALL_ROOT=$pkgdir install
}
