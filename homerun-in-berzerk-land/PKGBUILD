# Maintainer: Florian Léger <florian dot leger at insa dash rouen dot fr>

pkgname=homerun-in-berzerk-land
pkgver=1.0
pkgrel=3
pkgdesc='Hit the geek and make him fly (Flash game).'
arch=('any')
url='http://www.berzerkstudio.com/'
license=('unknown')
depends=('flashplayer-standalone')
_baseurl="http://www.playhub.com/swf"
_swf="homerun-bezerk.swf"
source=("${_baseurl}/${_swf}"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('77de342b99cb7e14953c346894e60c11'
         '5d516321c13a70842e474d113176d7e1'
         '71f850e4f0f335cb0578ab41170fada6'
         '008bbae81f4eb5f9161df9bc0e9aece4')

package() {
  # Install the .swf file
  install -Dm644 "${srcdir}/${_swf}" "${pkgdir}/usr/share/games/${pkgname}/${_swf}"

  # Install launch script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

