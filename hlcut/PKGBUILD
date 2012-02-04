# Contributer: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=hlcut
pkgver=0.0.1.2
pkgrel=1
pkgdesc="program for cutting VDR recordings"
url="http://www.htpc-forum.de"
depends=()
optdepends=('vdr')
arch=('i686' 'x86_64')
license=('GPL')
source=(http://www.htpc-forum.de/download/hlcut.tgz)
md5sums=('b61d91e8ce3fead17ed227b9a9466dd3')

build() {
  cd $startdir/src/$pkgname
  cat ../../hlcut.diff |patch -p1

  mkdir -p $startdir/pkg/usr/bin

  /usr/bin/make || return 1
  /usr/bin/make BINDIR=$startdir/pkg/usr/bin install

  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp COPYING $pkgdir/usr/share/doc/$pkgname || return 1  
  cp README $pkgdir/usr/share/doc/$pkgname || return 1
}
