# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
#               http://blog.viridian-project.de/
pkgname=fortune-mod-kentilton
pkgver=20070912
pkgrel=1
pkgdesc="Quotes by Kenny Tilton from comp.lang.lisp"
url="http://www.pasternacki.net/en/ken-tilton-fortunes/"
license=""
arch=('i686')
depends=(fortune-mod)
makedepends=(fortune-mod)
source=('http://viridian-project.de/~sky/kentilton')
md5sums=('819e759e408273d50d121a7f151d5431')

build() {
  mkdir -p $startdir/pkg/usr/share/fortune &&
  cp $startdir/src/kentilton $startdir/pkg/usr/share/fortune/
  cd $startdir/pkg/usr/share/fortune && strfile kentilton
}
