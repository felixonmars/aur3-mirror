# Maintainer: Christoph Seitz <seitz.christoph@gmail.com>
#based on ttf-source-sans-pro

pkgname=ttf-source-code-pro
pkgver=1.017
pkgrel=1
pkgdesc="A set of monospaced OpenType fonts designed for coding environments"
arch=('any')
url='http://sourceforge.net/projects/sourcecodepro.adobe/'
license=('custom:OFL 1.1')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-source-code-pro.install
source=("http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-${pkgver}.zip")
md5sums=('e59ce4be04d44c22e380865142bad0e3')

package() {
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}/TTF"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
