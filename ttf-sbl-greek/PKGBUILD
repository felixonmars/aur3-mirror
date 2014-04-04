pkgname=ttf-sbl-greek
pkgver=1.00BUILD010
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
url="http://www.sbl-site.org/educational/BiblicalFonts_SBLGreek.aspx"
license=('custom')
source=(http://www.sbl-site.org/Fonts/SBL_grk.ttf)
install=$pkgname.install
md5sums=('0e2ed0ab7fb81e540dab3203fc8386e3')

package()
{
      mkdir -p ${pkgdir}/usr/share/fonts/TTF
      install -Dm644 ${srcdir}/SBL_grk.ttf ${pkgdir}/usr/share/fonts/TTF/SBL_grk.ttf
}
