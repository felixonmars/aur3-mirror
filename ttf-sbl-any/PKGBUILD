pkgname=ttf-sbl-any
pkgver=1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Three SBL Fonts (SBL Greek, SBL Hebrew, SBL BLit)"
arch=('any')
url="http://www.sbl-site.org/educational/BiblicalFonts_FAQ.aspx"
license=('custom')
source=('http://www.sbl-site.org/Fonts/SBL_grk.ttf'
'http://www.sbl-site.org/Fonts/SBL_Hbrw.ttf'
'http://www.sbl-site.org/Fonts/SBL_BLit.ttf')
install=$pkgname.install
md5sums=('0e2ed0ab7fb81e540dab3203fc8386e3'
         'dbf49ba8a07d2e0e73b9b76aabd694f0'
         '35e8cbf89523a2189c009e8a66a2a693')

package()
{
      mkdir -p ${pkgdir}/usr/share/fonts/TTF
      install -Dm644 ${srcdir}/SBL_grk.ttf ${pkgdir}/usr/share/fonts/TTF/SBL_grk.ttf
      install -Dm644 ${srcdir}/SBL_Hbrw.ttf ${pkgdir}/usr/share/fonts/TTF/SBL_Hbrw.ttf
      install -Dm644 ${srcdir}/SBL_BLit.ttf ${pkgdir}/usr/share/fonts/TTF/SBL_BLit.ttf
}
