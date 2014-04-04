pkgname=ttf-sbl-hebrew
pkgver=1.56aBUILD016
pkgrel=3
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
license=('custom')
url="http://www.sbl-site.org/educational/BiblicalFonts_SBLHebrew.aspx"
source=(http://www.sbl-site.org/Fonts/SBL_Hbrw.ttf)
install=$pkgname.install
md5sums=('dbf49ba8a07d2e0e73b9b76aabd694f0')

package()
{
      mkdir -p ${pkgdir}/usr/share/fonts/TTF
      install -Dm644 ${srcdir}/SBL_Hbrw.ttf ${pkgdir}/usr/share/fonts/TTF/SBL_Hbrw.ttf
}
