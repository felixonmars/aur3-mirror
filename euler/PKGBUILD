# Maintainar:  TDY <tdy@archlinux.info>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=euler
pkgver=1.61.0
pkgrel=7
pkgdesc="A mathematical programming environment similar to Matlab and Octave"
arch=('i686' 'x86_64')
url="http://euler.sourceforge.net/"
license=('GPL')
depends=('gtk2')
options=('docs')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('4a45d7aaba2b73c7978e6d5623141103')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/extern int command_count;/static int command_count;/' src/command.c
  sed -i 's/CLK_TCK/CLOCKS_PER_SEC/' src/main.c
  LDFLAGS+=/lib/libm.so.6 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
