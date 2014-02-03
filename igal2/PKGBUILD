# Maintainer: Alex Chen <mdk82@mail.ru>

pkgname=igal2
pkgver=2.1
pkgrel=2
pkgdesc="Command line HTML/CSS image gallery generator"
arch=('i686' 'x86_64')
url="http://igal.trexler.at"
license=('GPL2')
depends=('imagemagick' 'perl')
optdepends=('libjpeg: alternative to the ImageMagick')

source=(http://igal.trexler.at/$pkgname-$pkgver.tar.gz
        igal2.im.patch
        igal2.path.patch
        1.patch
        2.patch)
md5sums=('b6655427146a4590ed6666d5ac29958e'
         'ba9d8e40a9d71e4f170f9084302463f0'
         'b11332ddbadb52eb6ed9f736e1db4721'
         '4c6397c1c39a24292eb9afcc912be6f6'
         'b6fd34a600a46a561b1fe5ffe18e22dc')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  # to speedup startup, don't check if ImageMagick is present.
  patch < $srcdir/igal2.im.patch || return 1

  # fix the installation path
  patch < $srcdir/igal2.path.patch || return 1

  # set utf-8 codepage
  patch < $srcdir/1.patch || return 1
  patch < $srcdir/2.patch || return 1

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/share/igal2
  mkdir -p $pkgdir/usr/share/doc/igal2

  cp igal2 $pkgdir/usr/bin/ || return 1

  cp COPYING ChangeLog README $pkgdir/usr/share/doc/igal2/ || return 1

  cp directoryline2.html indextemplate2.html slidetemplate2.html \
     tile.png igal2.css $pkgdir/usr/share/igal2/ || return 1

  cp igal2.1 $pkgdir/usr/share/man/man1/ || return 1

}
