#Contributor: Luminary
#Maintainer: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-theme-jelly-bean
pkgver=2.6
pkgrel=1
pkgdesc="Jelly Bean 4.1 theme for cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/122"
license=('unknown')
depends=('cinnamon')
optdepends=('ttf-roboto: roboto font for theme')
source=(http://cinnamon-spices.linuxmint.com/uploads/themes/RU9G-3F6Y-L4NE.zip)

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Jelly_Bean_${pkgver} ${pkgdir}/usr/share/themes/
  rm -rf ${pkgdir}/usr/share/themes/Jelly_Bean_${pkgver}/Roboto_FONT
}

sha256sums=('5341f6ef3681b610b428cf2f9d57780c6b91d44bcecf07e248d7a2ee1c0a77c4')
