# Contributor: Vincent Kriek <vincent@vincentkriek.nl>
pkgname=hex2bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Converts Motorola and Intel hex files to binary"
arch=('i686' 'x86_64')
url="http://hex2bin.sourceforge.net/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/hex2bin/hex2bin/Hex2bin-$pkgver.tar.bz2")

build() {
  cd "$srcdir/Hex2bin"

  #No makefile? We'll do it ourselves. I don't know how to use cflags from makepkg.conf here...
  gcc hex2bin.c -o hex2bin
  gcc mot2bin.c -o mot2bin

  mkdir -p $pkgdir/usr/bin/

  install -m 755 hex2bin $pkgdir/usr/bin/hex2bin
  install -m 755 mot2bin $pkgdir/usr/bin/mot2bin
}

# vim:set ts=2 sw=2 et:
md5sums=('0a72e092a7d33a19432c0de8d255902a')
