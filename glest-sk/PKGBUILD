# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-sk
pkgver=2.0.0
pkgrel=1
pkgdesc="Slovak language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/slovak_${pkgver}.zip)
md5sums=('a31d07ed2c24da87628590e43f6c131f')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/slovak.lng" || return 1
}
