# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>
pkgname=concurrent_bondi
pkgver=20111205
pkgrel=1
pkgdesc="An extension of the bondi programming language to support concurrency"
arch=('i686' 'x86_64')
url="http://www-staff.it.uts.edu.au/~tgwilson/concurrent_bondi/"
license=('BSD')
depends=('readline')
makedepends=('ocaml' 'ed')
conflicts=('bondi')
source=(http://www-staff.it.uts.edu.au/~tgwilson/$pkgname/$pkgver-bondi.tar)
md5sums=('56396bdadd7c55a656adab3e050a403b')

build() {
  cd "$srcdir/bondi/src"
  ./configure --prefix=/usr

  # Don't fail when there are no examples or containers to install
  sed -i 's|\./install-sh \.\./samples|-&|' Makefile
  sed -i 's|\./install-sh \.\./containers|-&|' Makefile

  make depend
  make bondi
}

package() {
  cd "$srcdir/bondi/src"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/bondi/BSD-LICENCE" "$pkgdir/usr/share/licenses/$pkgname/BSD-LICENCE"
}

# vim:set ts=2 sw=2 et:
