# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=glest-tr
pkgver=3.1.2
pkgrel=1
pkgdesc="Turkish language pack for Glest"
arch=('any')
url="http://www.glest.org"
license=('GPL')
depends=('glest')
source=(http://www.glest.org/files/contrib/translations/turkish_${pkgver}.zip)
md5sums=('7958618435938c2cdf067ea6917d144b')

build() {
  cd ${srcdir}
  install -D -m 644 *.lng "${pkgdir}/opt/glest/data/lang/turkish.lng" || return 1
}
