# Contributor:	Elena	``of Valhalla''	Grandi	<gmail.com: elena.valhalla>
# Maintainer:	Jesse			Jaara	<gmail.com: jesse.jaara>

pkgname=ttf-akkadian
pkgver=7.15
pkgrel=1
pkgdesc="Font for cuneiform scripts (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/{Akkadian,Assyrian}.zip LICENSE)
install=${pkgname}.install

package()
{
  for file in "${srcdir}"/*ttf; do
    install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
  done
  install -m 644 -D "${srcdir}/LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('5046ea4eb3e9c3c546794bc1d5c45a4d'
         '764095636abae9b97e8d09939819d6c7'
         'bc1709dc3b1f6a7545ab366923e01a1c')
