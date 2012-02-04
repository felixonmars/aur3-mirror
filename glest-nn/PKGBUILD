# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-nn
pkgver=3.1.2
pkgrel=1
pkgdesc="Norvegian language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/norsk_${pkgver}.zip)
md5sums=('56113995e1e8da088ccdf2841dc663dc')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/norsk.lng" || return 1
}
