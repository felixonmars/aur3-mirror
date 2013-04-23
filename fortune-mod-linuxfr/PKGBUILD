# Maintainer: flow
 
pkgname=fortune-mod-linuxfr
pkgver=20130420
pkgrel=1
pkgdesc="linuxfr fortune cookie file in french."
arch=('any')
license=('custom')
depends=('fortune-mod')
#source="fortunes.txt"
source="http://sam.linuxfr.org/fortunes.txt"
url="http://sam.linuxfr.org/"
md5sums=('09B36E08809B45FDF3936584AAE57242')
 
build() {
  cd ${srcdir}
  #iconv -f iso-8859-1 -t utf8 fortunes.txt --output linuxfr
  mv fortunes.txt linuxfr
  strfile linuxfr linuxfr.dat
}
 
package() {
  install -d ${pkgdir}/usr/share/fortune/fr
  install -m644 ${srcdir}/linuxfr* ${pkgdir}/usr/share/fortune/fr
}
