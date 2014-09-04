# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="dasm"
pkgver="2.20.11_2014.03.04"
_pkgverpath="2.20.11-20140304"
pkgrel="1"
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including MOS 6502 & 6507, Motorola 6803, 68705 & 68HC11, Hitachi HD6303 (extended Motorola 6801), and Fairchild F8."
arch=("i686" "x86_64")
url="http://dasm-dillon.sourceforge.net/"
license=("GPL")
source=("http://downloads.sourceforge.net/project/dasm-dillon/dasm-dillon/2.20.11/$pkgname-${pkgver//_/-}-source.tar.gz")
sha1sums=("2ce78b29505b31778b8f796ba4b161b9f890e77e")

build() {
  cd "$srcdir/$pkgname-$_pkgverpath"
  make
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$_pkgverpath/bin/dasm" "$pkgdir/usr/bin/dasm"
  install -Dm 755 "$srcdir/$pkgname-$_pkgverpath/bin/ftohex" "$pkgdir/usr/bin/ftohex"
 
  for doc in AUTHORS ChangeLog COPYING CREDITS FUTURE NEWS README README.ANDREW doc/dasm.txt doc/ftohex.txt; do
   install -Dm 644 "$srcdir/$pkgname-$_pkgverpath/$doc" "$pkgdir/usr/share/doc/dasm/${doc/*\/}"
  done
 
  mkdir -p "$pkgdir/usr/share/dasm"
  cp -R "$srcdir/$pkgname-$_pkgverpath"/{machines,test} "$pkgdir/usr/share/dasm"
 
  chmod 755 "$pkgdir/usr/share"/{dasm,dasm/machines,dasm/machines/atari2600,dasm/machines/channel-f,dasm/test}
  chmod 644 "$pkgdir/usr/share/dasm"/{machines/atari2600,machines/channel-f,test}/*
}
