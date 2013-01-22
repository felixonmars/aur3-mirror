# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>
pkgname=bondi
pkgver=2.04
pkgrel=1
pkgdesc="A programming language centred on pattern-matching"
arch=('i686' 'x86_64')
url="http://bondi.it.uts.edu.au/"
license=('BSD')
depends=('readline')
makedepends=('ocaml' 'ed')
source=(http://bondi.it.uts.edu.au/$pkgname-$pkgver/bondi.tar)
md5sums=('2e0e564c94163ef86c5ceb506bf49504')

build() {
  cd "$srcdir/$pkgname/src"
  ./configure --prefix=/usr

  # Don't fail when there are no examples or containers to install
  sed -i 's|\./install-sh \.\./samples|-&|' Makefile
  sed -i 's|\./install-sh \.\./containers|-&|' Makefile

  make depend
  make bondi
}

package() {
  cd "$srcdir/$pkgname/src"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname/BSD-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/BSD-LICENCE"
}

# vim:set ts=2 sw=2 et:
