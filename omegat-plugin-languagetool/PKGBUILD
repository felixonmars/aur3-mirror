# Maintainer: Gilrain <pierre.buard+aur gmail com>

pkgname=omegat-plugin-languagetool
pkgver=0.4
pkgrel=1
pkgdesc="Proofreader for OmegaT."
arch=('any')
url="http://www.omegat.org/en/resources.html"
license=('GPL3' 'Apache' 'LGPL' 'custom:Morfologik' 'custom:Segment')
depends=('omegat')
groups=('omegat-plugins')
source=("http://downloads.sourceforge.net/project/omegat-plugins/OmegaT-LanguageTool/${pkgver}-2.3/OmegaT-LanguageTool_${pkgver}-2.3.zip")
sha1sums=('24a3ea5935f6b031566cf2acd28b8e33ab85613d')

package() {
  install -d -m755 ${pkgdir}/usr/share/{java/omegat/plugins/languagetool,licenses/${pkgname},doc/${pkgname}}

  install -Dm644 *.jar "${pkgdir}/usr/share/java/omegat/plugins/languagetool/"

  install -Dm644 "Readme_licences.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCES"
  install -Dm644 "Morfologik-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Morfologik"
  install -Dm644 "Segment-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Segment"

  install -Dm644 "Readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
