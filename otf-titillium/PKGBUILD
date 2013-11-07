# Maintainer: Johann Gründl <johann.gruendl@gmail.com>

pkgname=otf-titillium
pkgver=2
pkgrel=1
pkgdesc="Titillium is an OFL licensed typeface designed inside Campi Visivi's Type Design course"
arch=('any')
license=('custom:OFL')
url='http://www.campivisivi.net/titillium/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf-titillium.install
source=("http://www.campivisivi.net/titillium/download/Titillium_roman_upright_italic_2_0_OT.zip")
sha1sums=('f4dd29ce864df4c418b6c944e8747fe6b090f750')

package() {
  cd "${srcdir}/Titillium_roman_upright_italic_2_0_OT"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 OFL-titillium.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}