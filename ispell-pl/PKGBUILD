# Maintainer: Dorota Celińska <tehora at jakilinux dot org>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: thereidos <thereidos@gmail.com>

pkgname=ispell-pl
pkgver=20141210
pkgrel=1
pkgdesc="Polish dictionary for ispell"
url="http://www.sjp.pl/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ispell')
source=(http://sjp.pl/slownik/ort/sjp-${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('fda66263716abe8470cfb1a102e24d56')

build() {
  cd ${srcdir}/sjp-${pkgname}-${pkgver}
  ./build polish.all
}

package() {
  cd ${srcdir}/sjp-${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/lib/ispell
  install -Dm 644 polish.aff ${pkgdir}/usr/lib/ispell/  
  install -Dm 644 polish.hash ${pkgdir}/usr/lib/ispell/
}

