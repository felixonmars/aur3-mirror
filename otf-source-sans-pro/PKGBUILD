# Maintainer: Jonathan Ryan <jryan@curious-computing.com>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=otf-source-sans-pro
pkgver=1.050
pkgrel=7
pkgdesc="Adobe's fonts designed for user interfaces"
arch=('any')
license=('custom:OFL')
url='http://sourceforge.net/projects/sourcesans.adobe/'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf-source-sans-pro.install
source=("http://downloads.sourceforge.net/project/sourcesans.adobe/SourceSansPro_FontsOnly-${pkgver}.zip")
sha1sums=('f3af1201c80a86f1dd6e045a565c96bdd12d445f')

package() {
  cd "${srcdir}/SourceSansPro_FontsOnly-${pkgver}/OTF"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
  cd "${srcdir}/SourceSansPro_FontsOnly-${pkgver}"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
