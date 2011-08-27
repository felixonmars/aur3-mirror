# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-ca
pkgver=1.2.2
pkgrel=1
pkgdesc="Catala language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/catala_${pkgver}.zip)
md5sums=('0ff52ece4c408f3a01a54dda8f17e994')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/glest/data/lang
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/catala.lng" || return 1
}
