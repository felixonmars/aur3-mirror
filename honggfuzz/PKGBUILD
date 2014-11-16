# Author: Robert Swiecki <swiecki [at] google [dot] com>
# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so> 
# Copyright 2010 by Google Inc.
pkgname="honggfuzz"
pkgver=r66
pkgrel=1
pkgdesc="A general-purpose, easy-to-use fuzzer with interesting analysis options."
arch=('i686' 'x86_64')
url="https://code.google.com/p/honggfuzz/"
license=('Apache')
makedepends=('svn' 'gcc' 'make')
depends=('udis86')
optdepends=('python: python examples support')
conflicts=('honggfuzz')
provides=('honggfuzz')
source=("$pkgname"::'svn+http://honggfuzz.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s" $(svn info | grep ^Rev | head -1 | awk '{print $2}')
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples/externalfuzzers"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples/inputfiles"
  install -d "$pkgdir/usr/share/doc/$pkgname/examples/targets"
  install -d "$pkgdir/usr/bin"
  install -c -m 755 "$pkgname" "$pkgdir/usr/bin"

  install -c -m 755 examples/run-honggfuzz-on-badcode1-with-externalfuzzer.sh $pkgdir/usr/share/doc/$pkgname/examples
  install -c -m 755 examples/run-honggfuzz-on-badcode1.sh $pkgdir/usr/share/doc/$pkgname/examples/
  install -c -m 644 examples/externalfuzzers/rangeFuzz.py $pkgdir/usr/share/doc/$pkgname/examples/externalfuzzers
  install -c -m 755 examples/externalfuzzers/o20.sh $pkgdir/usr/share/doc/$pkgname/examples/externalfuzzers
  install -c -m 644 examples/externalfuzzers/lowBytesIncrease.py $pkgdir/usr/share/doc/$pkgname/examples/externalfuzzers
  install -c -m 755 examples/run-honggfuzz-on-badcode1.sh $pkgdir/usr/share/doc/$pkgname/examples/run-honggfuzz-on-badcode1.sh
  install -c -m 644 examples/inputfiles/badcode1.txt $pkgdir/usr/share/doc/$pkgname/examples/inputfiles/badcode1.txt
  install -c -m 644 examples/targets/badcode1.c $pkgdir/usr/share/doc/$pkgname/examples/targets/badcode1.c
  install -c -m 644 examples/targets/Makefile $pkgdir/usr/share/doc/$pkgname/examples/targets/Makefile

}
