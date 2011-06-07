# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=libpsychrometric
pkgver=1.0
pkgrel=1
pkgdesc="Psychrometrics are the measurements of moist air, from the roots psychro and metric"
arch=('i686' 'x86_64')
url="http://www.bae.uky.edu/gates/psych/psych.htm"
license=('custom')
source=($pkgname.tar.gz)
md5sums=('59bc6bbcf1b39eb0650c973edf232162')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir"
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}