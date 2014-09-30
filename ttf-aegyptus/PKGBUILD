# Contributor:	Elena	``of Valhalla''	Grandi	<gmail.com: elena.valhalla>
# Maintainer:	Jesse			Jaara	<gmail.com: jesse.jaara>

pkgname=ttf-aegyptus
pkgver=5.03
pkgrel=1
pkgdesc="Font for Egyptian Hieroglyphs (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/{Aegyptus,Nilus,Gardiner}.zip LICENSE)
install=${pkgname}.install

package()
{
  for file in "${srcdir}"/*ttf; do
    install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
  done

  install -m 644 -D "${srcdir}/LICENSE"                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('9c18b8ab93f480d07a090cb6dcf879e2'
         'ba647eb9404706ef70663ec616516db0'
         '821b572942ca8535bc9800be766431c7'
         'bc1709dc3b1f6a7545ab366923e01a1c')
