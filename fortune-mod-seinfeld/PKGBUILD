# Maintainer: blueray
# Contributor: blueray

pkgname=fortune-mod-seinfeld
pkgver=9
pkgrel=2
pkgdesc="Seinfeld (1989-1998) was an American television sitcom, airing on NBC, about four friends living in New York City, considered to be one of the most popular and influential of the 1990s in the U.S."
url="https://en.wikiquote.org/wiki/Seinfeld"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(seinfeld)
md5sums=('e3e1e08a3f34f1ac13dbe1009e531dbb')

build() {
  cd "$srcdir"
  strfile seinfeld seinfeld.dat
}

package () {
  install -D -m644 seinfeld $pkgdir/usr/share/fortune/seinfeld
  install -D -m644 seinfeld.dat $pkgdir/usr/share/fortune/seinfeld.dat
}
