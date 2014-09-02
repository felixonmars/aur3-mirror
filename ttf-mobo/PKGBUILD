# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=ttf-mobo
pkgver=001.02.12b
pkgrel=2
pkgdesc="Free Japanese Gothic/Mincho Font based on IPA font and M+ font"
arch=('any')
url="http://yozvox.web.fc2.com/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://yozvox.web.fc2.com/MoboMoga-${pkgver}.7z)
md5sums=('7adcca4143c4903c77e1454aa3b6f1bf')

package() {
  cd ${srcdir}/MoboMoga

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 mobo*.ttc ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 IPA_Font_License_Agreement_v1.0.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
