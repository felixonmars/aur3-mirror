# Maintainer: Daniel Woffinden <d.woffinden@live.co.uk>

pkgname=fortune-mod-farscape
pkgver=4
pkgrel=2
pkgdesc='Fortune cookies: Farscape (TV series), scraped from wikiquotes.org'
arch=('any')
url='http://github.com/dwoffinden/fortune-mod-farscape'
license=('CC-BY-SA')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('bede05dd7f69430fbd82425ca2b9eb07')

build() {
  cd ${srcdir}

  perl wiki.pl > farscape

  strfile farscape farscape.dat

  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}

