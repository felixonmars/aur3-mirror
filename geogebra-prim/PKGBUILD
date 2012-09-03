# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra-prim
pkgver=1
pkgrel=2
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet - for primary school"
arch=('any')
url="http://www.geogebra.org/"
license=('custom')
depends=('geogebra')
install='geogebra-prim.install'
source=("${pkgname}.sh"
	"${pkgname}.desktop"
	"${url}download/license.txt")


package() {
  cd "${srcdir}"

  # Installing launch script
  install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  
  # Creating menu item
  install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Installing license
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('7d8824f9f18aefc4c12a90f03f67bec9'
         '3bd363c33dfa8b6510e8e6a4e77611e7'
         'eea82c3c9a213599777dfa6e21ed2867')
