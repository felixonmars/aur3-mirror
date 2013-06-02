# Contributor: muflax <muflax@gmail.com>

pkgname=ttf-ipa-mona
pkgver=1.0.8
_opfc_pkgver=1.1.1
pkgrel=2
pkgdesc="Extended Japanese Mona Font"
arch=('any')
license=('custom:Jun Kobayashi')
url="http://www.geocities.jp/ipa_mona/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
# The font is only available as a bundle with this driver.
source=("http://www.geocities.jp/ipa_mona/opfc-ModuleHP-${_opfc_pkgver}_withIPAMonaFonts-${pkgver}.tar.gz")
md5sums=('8d56b00ff006c6f3c47eae83d7fc6e3a')

package() {
  cd "${srcdir}/opfc-ModuleHP-${_opfc_pkgver}_withIPAMonaFonts-${pkgver}/fonts"
  for i in *.ttf; do install -Dm644 "${i}" "${pkgdir}/usr/share/fonts/TTF/${i}"; done
  install -Dm644 COPYING.font.ja "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.ja"
}
