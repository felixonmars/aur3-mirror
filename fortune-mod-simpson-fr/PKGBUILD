# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=fortune-mod-simpson-fr
pkgver=20101025
pkgrel=1
pkgdesc="Fortune cookies: Les Simpson in french."
arch=('any')
license=('custom')
depends=('fortune-mod')
source="fortunes.txt"
url="http://fr.wikiquote.org/wiki/Les_Simpson"
md5sums=('ca6a9fa1f75dbf10185b554bbbaffce7')

build() {
  cd ${srcdir}
  iconv -f iso-8859-1 -t utf8 fortunes.txt --output simpson
  strfile ./simpson
  install -D -m644 simpson $startdir/pkg/usr/share/fortune/fr/simpson
  install -D -m644 simpson.dat $startdir/pkg/usr/share/fortune/fr/simpson.dat
}
