# Contributor: Pavel Shevchuk <stlwrt@gmail.com>
pkgname=sonic-snap
pkgver=1.7
pkgrel=1
pkgdesc="sn9c102 webcam application for linux"
url="http://www.stolk.org/sonic-snap/"
license="GPL"
depends=(fltk)
makedepends=()
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
install=
source=(http://www.stolk.org/sonic-snap/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('072546bb305817c311143d60edbc4219')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e 's/g++-4.0/g++/g' Makefile || return 1
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  make DESTDIR=$startdir/pkg install
}
