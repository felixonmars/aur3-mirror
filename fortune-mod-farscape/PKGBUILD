pkgname=fortune-mod-farscape
pkgver=6
pkgrel=1
pkgdesc='Fortune cookies: Farscape (TV series), scraped from wikiquotes.org'
arch=('any')
url='http://github.com/dwoffinden/fortune-mod-farscape'
license=('CC-BY-SA')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('cb270b4dd065f9b91fb4468bcc332516')

build() {
  cd ${srcdir}
  perl wiki.pl > farscape
  strfile farscape farscape.dat
}

package() {
  cd ${srcdir}
  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}
