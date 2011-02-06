# Maintainer: Jonathan Rascher <jon at bcat.name>
pkgname=otf-district-thin
pkgver=20101025
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A thin font from GarageFonts's District family by Kienan and Dylan Smith"
arch=('any')
url="http://www.philsfonts.com/freefont.html"
license=('custom:Phil'\''s Fonts/GarageFonts End User License Agreement')
depends=('fontconfig' 'xorg-font-utils')
source=(http://www.philsfonts.com/downloads/DistrictThinOTF.zip)
install=$pkgname.install
md5sums=('4978c4f2607bd788f84f3037db0f7ee5')

build() {
  cd "${srcdir}/District Thin - OTF" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF" || return 1
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
  install -m644 'GF EULA.pdf' "${pkgdir}/usr/share/licenses/${pkgname}/eula.pdf" || return 1
}

# vim:set ts=2 sw=2 et:
