# Maintainer: david.runge <david[d]runge[a]frqrec[d]com>
pkgname=rtf2scd
pkgver=1.0
pkgrel=1
pkgdesc="Converts .rtf to .scd files. Useful when using SuperCollider"
arch=('any')
url="https://github.com/davezerave/rtf2scd"
license=('GPL')
depends=('unrtf' 'sed')
backup=()
source=('rtf2scd'
        'makefile')
md5sums=('f0e3f563f2fa76c9cbb88637cd7b7888'
         '82087dfa968001457cec8ac3e4ffb905')
package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
