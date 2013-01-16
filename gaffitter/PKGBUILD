# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Artyom 'logus' Pervukhin <logus9@gmail.com>

pkgname=gaffitter
pkgver=0.6.0
pkgrel=1
pkgdesc="A command line utility for optimizing file allocation via a genetic algorithm"
arch=('i686' 'x86_64')
url="http://gaffitter.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('a4a0fa0b3eeeaf49624d2e1b78de3cff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr/" install
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
