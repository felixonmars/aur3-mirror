# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-ru
pkgver=3.1.2
pkgrel=1
pkgdesc="Russian language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/russian_${pkgver}.zip)
md5sums=('751481b6615f5e24c884fcc3837c3b4e')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/russian.lng" || return 1
}
