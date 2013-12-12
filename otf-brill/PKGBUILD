# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-brill
pkgdesc="Brill Typeface by John Hudson for Brill Publishing House (OpenType)"
pkgver=2.02
pkgrel=1
url="http://www.brill.com/about/brill-fonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install
_ucpkgver=${pkgver//./_}

source=("http://www.brill.com/sites/default/files/brill_font_package_${_ucpkgver}.zip")
md5sums=('1a172b6841346461d768c583922bd781')
sha512sums=('4bf0a8d26f48ac1b47f8b13cff2ad734509947ad66afbffe1e8bc4e4938f8832ab306c041dd6cee0a07ca87cb2bf80db2eea8c03ed431726f990098eea8d3b47')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp --no-preserve=ownership "${srcdir}/Brill_Typeface_${pkgver}/"*.otf "${pkgdir}/usr/share/fonts/${pkgname}"
  cp --no-preserve=ownership "${srcdir}/Brill_Typeface_${pkgver}/00_Brill_Fonts_Read_Me_First.txt" "${pkgdir}/usr/share/licenses/${pkgname}/end_user_license.txt"
  cp --no-preserve=ownership "${srcdir}/Brill_Typeface_${pkgver}/Brill_Typeface_User_Guide_${pkgver}.pdf" "${pkgdir}/usr/share/doc/${pkgname}/"
}
