# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-br
pkgver=3.1.2
pkgrel=1
pkgdesc="Brazilian language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/brazilian_${pkgver}.zip)
md5sums=('5fce9f2711c70794985854405cf47f8c')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/brazilian.lng" || return 1
}
