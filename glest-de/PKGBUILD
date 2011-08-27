# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-de
pkgver=3.1.2
pkgrel=1
pkgdesc="German language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/german_${pkgver}.zip)
md5sums=('71fd759e8c0dacffc50d2d732cd53927')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/glest/data/lang
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/german.lng" || return 1
}
