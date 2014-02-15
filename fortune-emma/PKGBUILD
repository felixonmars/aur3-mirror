# Maintainer: aleray <alexandre@stdin.fr>
# Compiled by Femke Snelting, from <http://www.gutenberg.org/ebooks/20715>

pkgname=fortune-emma
pkgver=20140214
pkgrel=1
pkgdesc="Fortune cookies: quoted from 'Marriage and love' by Emma Goldman"
arch=('i686' 'x86_64')
url="http://crunchbang.org/forums/viewtopic.php?pid=104984#p104984"
license=('unknown')
depends=('fortune-mod')
source=(emma)
md5sums=('bc99b958d3a0732bef649c1c11075964')
sha1sums=('504b561ee9cb9eed5d504b6dafdf2b097ca61261')

build() {
  cd ${srcdir}
  strfile emma emma.dat
}

package() {
  install -d ${pkgdir}/usr/share/fortune
  install -m644 ${srcdir}/emma* ${pkgdir}/usr/share/fortune
}
