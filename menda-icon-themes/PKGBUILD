# Maintainer:  anexation
# Contributor: Rob McCathie <rob@manjaro.org>

pkgbase=menda-icon-themes
pkgname=('menda-circle-icon-theme' 'menda-square-icon-theme')
pkgver=20141219
pkgrel=1
_git='06232a0098e88d33bef931083736141ab67976da'
arch=('any')
url="https://github.com/manjaro/menda-icon-themes"
license=('GPL')
depends=('hicolor-icon-theme' 'librsvg')
optdepends=('menda-themes: Recommended themes'
            'menda-themes-dark: Recommended themes')
options=(!emptydirs !strip)
replaces=('menda-icon-themes')
source=("${pkgbase}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${_git}.tar.gz")
sha1sums=('SKIP')


package_menda-circle-icon-theme() {
  pkgdesc="Menda Circle Icon Theme"
  
  install -dm755 "${pkgdir}/usr/share/icons"
  #install -Dm755 "${srcdir}/${pkgbase}-${_git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}-${_git}/Menda-Circle" "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}

package_menda-square-icon-theme() {
  pkgdesc="Menda Square Icon Theme"
  
  install -dm755 "${pkgdir}/usr/share/icons"
  #install -Dm755 "${srcdir}/${pkgbase}-${_git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/${pkgbase}-${_git}/Menda-Square" "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
