# Contributor:	Elena	``of Valhalla''	Grandi	<gmail.com: elena.valhalla>
# Maintainer:	Jesse 			Jaara	<gmail.com: jesse.jaara>

pkgname=ttf-symbola
pkgver=7.06
pkgrel=1
pkgdesc="Font for unicode symbols (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Symbola706.zip LICENSE)
install=${pkgname}.install

package()
{
    install -m 644 -D "${srcdir}/Symbola.ttf" "${pkgdir}/usr/share/fonts/TTF/Symbola.ttf"
    install -m 644 -D "${srcdir}/LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m 644 -D "${srcdir}/Symbola.pdf" "${pkgdir}/usr/share/doc/${pkgname}/Symbola.pdf"
}

md5sums=('11c305555e9c7659cbb0db0b181cf9a7'
         'bc1709dc3b1f6a7545ab366923e01a1c')
