# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-pt
pkgver=2.0.0
pkgrel=1
pkgdesc="Portuguese language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/portugues_${pkgver}.zip)
md5sums=('f133c241ac021ad30d54d0ef48b0f64f')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/portugues.lng" || return 1
}
