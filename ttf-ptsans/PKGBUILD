# Contributor: pHoederr <phoederr[at]gmail[dot]com>

pkgname=ttf-ptsans
pkgver=1.0
pkgrel=1
pkgdesc="Cyrillic Sans-serif font family by ParaType"
arch=('i686' 'x86_64')
url="http://fonts.ru/public/"
license=('pt_openlicense')
depends=('fontconfig' 'xorg-font-utils')
source=(http://www.fontstock.com/public/PTSans.zip)
md5sums=('36ce554c8e19d81ddc9335c38f99d25c')

build() {
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF/
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}/
  # Font installation
  install -m644 ${startdir}/src/*.ttf ${startdir}/pkg/usr/share/fonts/TTF/

  # License installation
  install -D -m644 ${startdir}/src/license_ru.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/
  install -D -m644 ${startdir}/src/license_eng.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
