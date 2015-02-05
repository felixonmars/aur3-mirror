# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-genjyuuothic
pkgver=20150116
_sfver=7762
pkgrel=1
pkgdesc="A Japanese font based on Source Han Sans (rounded)"
url="http://jikasei.me/font/genjyuu/"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=(http://${_mirror}.dl.sourceforge.jp/users/7/${_sfver}/genjyuugothic-${pkgver}.7z)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('4bc363af27bb03cd0d0e8cedbb68db0b')
