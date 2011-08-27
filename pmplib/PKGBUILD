# Maintainer: peshane <peshane@free.fr>
pkgname=pmplib
pkgver=0.14
pkgrel=1
pkgdesc="Portable Media Player library (PMPlib) is an open source project to develop a management software/library for various portable media players"
arch=('i686' 'x86_64')
url="http://pmplib.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('eea9187841ec4a597f5aae54c765ddcb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
