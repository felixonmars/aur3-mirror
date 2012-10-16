# Maintainer: Daniel Woffinden <d.woffinden@live.co.uk>

pkgname=fortune-mod-farscape
pkgver=3
pkgrel=1
pkgdesc="Fortune cookies: Farscape (TV series), scraped from wikiquotes"
arch=('any')
url="http://en.wikiquote.org/wiki/Farscape"
license=('CC-BY-SA')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('64014e0c5f788d942ecb0b3a99e1c838')

build() {
  cd ${srcdir}

  perl wiki.pl > farscape

  strfile farscape farscape.dat

  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}

