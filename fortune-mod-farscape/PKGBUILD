# Maintainer: d.woffinden
pkgname=fortune-mod-farscape
pkgver=r1678980
pkgrel=2
pkgdesc='Fortune cookies: Farscape (TV series), scraped from https://en.wikiquote.org/wiki/Farscape'
arch=('any')
url='http://github.com/dwoffinden/fortune-mod-farscape'
license=('CCPL:by-sa3.0')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('db6056315ab6885c552129ca6c5388c1')

pkgver() {
  cd "$srcdir"
  printf "r%s" $(perl wiki.pl revision)
}

build() {
  cd "$srcdir"
  perl wiki.pl > farscape
  strfile farscape farscape.dat
}

package() {
  cd "$srcdir"
  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}
