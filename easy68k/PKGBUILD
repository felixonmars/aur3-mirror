# Maintainer: Danilo Bargen <gezuru@gmail.com>
pkgname=easy68k
pkgver=20110515
pkgrel=1
pkgdesc="A 68000 Structured Assembly Language IDE running on WINE."
arch=('any')
url="http://www.easy68k.com/"
license=('GPL')
depends=('wine')
source=('http://www.monroeccc.edu/ckelly/Files/EASy68K.zip' 'edit68k' 'sim68k')
md5sums=('d4f48ffa93cf84ab0cff4d4fa434b2c1'
         '6bbd2038bf0e967e88b47dfaec7c71f7'
         '0e6e6fdef8ade277cefc52691acd9780')

package() {
  mkdir -p $pkgdir/opt/easy68k $pkgdir/usr/bin
  cp -r $srcdir/* $pkgdir/opt/easy68k/
  cp edit68k sim68k $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/*
}

# vim:set ts=2 sw=2 et:
