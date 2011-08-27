# Maintainer: daniel g. siegel <dgsiegel@gmail.com>
pkgname="mpglen"
pkgver="0"
pkgrel=1
pkgdesc="A program to scan through a MPEG file and count the number of GOPs and frames."
depends=()
source=(http://www.iamnota.net/$pkgname/$pkgname.tar.gz)

url="http://www.iamnota.net/mpglen"
md5sums=('0c873fc663f6ab68714b17e9ec312956')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  install -D -m755 $startdir/src/$pkgname/mpglen $startdir/pkg/usr/bin/mpglen
}
