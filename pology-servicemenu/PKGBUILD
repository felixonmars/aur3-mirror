# Maintainer: Gilrain <pierre.buard+aur gmail com>
pkgname=pology-servicemenu
pkgver=1.3
pkgrel=1
pkgdesc="A service menu to access Pology sieves."
arch=('any')
url="http://www.kde-apps.org/content/show.php/pology-servicemenu?content=84454"
license=('GPL')
depends=('pology' 'kdebase-kdialog')
optdepends=('enchant: spell checking' 'languagetool: grammar checks')
source=(http://www.kde-apps.org/CONTENT/content-files/84454-${pkgname}-${pkgver}.tar.gz)
md5sums=('7a6eb7cb44984e8dacf0c94e7526c4e1')

package() {
  install -d ${pkgdir}/usr/share/kde4/services/ServiceMenus
  install -Dm644 ${srcdir}/kde_localization-{mo,po,pot}.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus
  install -d ${pkgdir}/usr/share/doc/pology
  install -m644 ${srcdir}/README.txt ${pkgdir}/usr/share/doc/pology/ServiceMenu
  install -m644 ${srcdir}/README-fr.txt ${pkgdir}/usr/share/doc/pology/ServiceMenu-fr
}
