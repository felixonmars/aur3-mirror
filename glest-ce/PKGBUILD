# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-ce
pkgver=3.1.2
pkgrel=1
pkgdesc="Cesky language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/cesky_${pkgver}.zip)
md5sums=('ae7e2b0ad4bc8622ebeb2e178816ddbd')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/cesky.lng" || return 1
}
