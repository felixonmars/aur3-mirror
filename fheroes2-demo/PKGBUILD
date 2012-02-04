# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=fheroes2-demo
pkgver=1
pkgrel=2
pkgdesc="Heroes 2 Demo data files for use with fheroes2"
url="http://en.wikipedia.org/wiki/Heroes 2"
arch=('any')
license=('custom')
provides=('fheroes2-data')
conflicts=('fheroes2-data')
source=(http://downloads.pcworld.com/pub/new/fun_and_games/adventure_strategy/h2demo.zip)
md5sums=('2a67d3b21b4dbdb2694720b8e75eed99')

build() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fheroes2/data" "$pkgdir/usr/share/fheroes2/maps"
  install -m644 DATA/* "$pkgdir/usr/share/fheroes2/data"
  install -m644 MAPS/* "$pkgdir/usr/share/fheroes2/maps"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/fheroes2-demo/license.txt"
}

# vim:set ts=2 sw=2 et:
