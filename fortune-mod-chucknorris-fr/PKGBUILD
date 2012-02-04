# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=fortune-mod-chucknorris-fr
pkgver=20110326
pkgrel=1
pkgdesc="Fortune cookies: Chuck Norris facts in french."
arch=('any')
license=('GPL')
depends=(fortune-mod)
source="fortunes.txt"
#http://www.chucknorrisfacts.fr/fortunes/fortunes.txt
url="http://www.chucknorrisfacts.fr"
md5sums=('94c7fb9e8e049c238100ddc587d65bef')

packages() {
  cd $startdir/src
  iconv -f iso-8859-1 -t utf8 fortunes.txt --output chucknorris
  strfile ./chucknorris
  mkdir -p $startdir/pkg/usr/share/fortune/fr/
  install -D -m644 chucknorris $startdir/pkg/usr/share/fortune/fr/chucknorris
  install -D -m644 chucknorris.dat $startdir/pkg/usr/share/fortune/fr/chucknorris.dat
}
