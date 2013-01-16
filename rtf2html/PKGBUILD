# Maintainer: TDY <tdy@archlinux.info>

pkgname=rtf2html
pkgver=0.2.0
pkgrel=1
pkgdesc="An RTF to HTML converter"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rtf2html/"
license=('LGPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver-gcc44.diff)
md5sums=('52a8efcd746e100ae147d28c0d0c71b6'
         '37924c94fa27955c1fa8e6443c72b635')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver-gcc44.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
