# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=blue
pkgver=1.7.5
pkgrel=2
pkgdesc="A unique, dynamic programming language with a minimalistic, intuitive syntax"
arch=('i686' 'x86_64')
url="http://www.lechak.info/blue/"
license=('GPL')
depends=('freetype2' 'libpng' 'mesa')
source=(http://www.lechak.info/$pkgname/$pkgname$pkgver.tgz
        $pkgname-$pkgver-png150.diff)
md5sums=('6a0e31bcc5d4a4c2a0633631a4569e30'
         '5ca29d04c98554762279d49e6bc3304b')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver-png150.diff
  sed -i 's/CFLAGS= -Wall -O3/CFLAGS+=/; /ln/d' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr/lib/" install
  install -dm755 "$pkgdir/usr/bin/"
  ln -sf ../lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
