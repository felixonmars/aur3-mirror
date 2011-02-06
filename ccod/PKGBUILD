# Contributor: bl4ckb1t <bl4ckb1t@gmail.com>
pkgname=ccod
pkgver=1.2.9
pkgrel=1
pkgdesc="Allows for a C,C++,ObjC source file to be Compiled on Demand prior to being executed." 
arch=('i686' 'x86_64')
url="http://ccod.sourceforge.net"
license=('MIT')
source=(http://downloads.sourceforge.net/ccod/$pkgname-$pkgver.tar.gz)
md5sums=('c6350e4f72c887ee7a188734d812d504')

build() {
  cd $startdir/src/
  ./configure --prefix=/usr
  sed -ie 's|/usr|${DESTDIR}|' Makefile
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,lib,include}
  make DESTDIR=$startdir/pkg/usr install
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
