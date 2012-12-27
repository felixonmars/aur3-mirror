# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Ryan Balfanz <rbalfanz@gmail.com>
pkgname=bottlerocket
pkgver=0.04c
pkgrel=1
pkgdesc="BottleRocket is a utility to allow the use of the X10 FireCracker wireless appliance control kit"
url="http://www.linuxha.com/bottlerocket"
license=""
arch=('i686' 'x86_64')
license=('LGPL')
install=$pkgname.install
source=("http://www.linuxha.com/bottlerocket/$pkgname-current.tar.gz")
sha256sums=('deb8fbf8856f87af15fa9883e07b1fddb2aa78f6b4c7d119ae4bd664dc1d19ae')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-x10port=/dev/firecracker --prefix=/usr
  make
  make bindir=$startdir/pkg/usr/bin install
}

# vim:set ts=2 sw=2 et:
