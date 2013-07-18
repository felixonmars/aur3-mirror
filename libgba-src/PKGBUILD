# Maintainer: Nicolas Hureau <archlinux@kalenz.fr>

pkgname=libgba-src
pkgver=20090222
pkgrel=1
pkgdesc='libgba for gameboy advance homebrew coding'
arch=('i686' 'x86_64')
url='http://www.devkitpro.org'
license=('GPL' 'LGPL')
depends=('devkitarm')
provides=('libgba')
options=(!strip)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9d85b64b323a5f2e8f8ec46ba8cb76ae3921e4b75b54d3b51b84a44fe41fc57a')

build() {
  cd "$srcdir"
  make
}

package () {
  cd "$srcdir"
  make install DEVKITPRO="$pkgdir/opt/devkitpro"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/devkitpro/$pkgname/${pkgname}_license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/${pkgname}_license.txt"
}

# vim:set ts=2 sw=2 et:
