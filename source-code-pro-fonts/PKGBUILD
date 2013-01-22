# Maintainer: Jonathan Arnold <jdarnold@buddydog.or
# Contributor: Jonathan Ryan <jryan@curious-computing.com>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=source-code-pro-fonts
pkgver=1.017
pkgrel=1
pkgdesc="A set of monospaced fonts (TTF & OTF) designed for coding environments"
arch=('any')
license=('custom:OFL')
url='http://sourceforge.net/projects/sourcecodepro.adobe/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=source-code-pro-fonts.install
source=("http://downloads.sourceforge.net/sourcecodepro.adobe/SourceCodePro_FontsOnly-$pkgver.zip")
md5sums=('e59ce4be04d44c22e380865142bad0e3')
conflicts=('ttf-source-code-pro' 'otf-source-code-pro')

package() {
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
