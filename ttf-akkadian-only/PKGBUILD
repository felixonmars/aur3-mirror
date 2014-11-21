pkgname=ttf-akkadian-only
pkgver=1.1
pkgrel=1
pkgdesc="Sumerian fonts, Sumero-Akkadian Cuneiform (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Akkadian.zip LICENSE)
install=${pkgname}.install

package()
{
  for file in "${srcdir}"/*ttf; do
    install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
  done

  install -m 644 -D "${srcdir}/LICENSE"                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('8528edd8484f59bd57c235176d8e481e'
         'bc1709dc3b1f6a7545ab366923e01a1c')