# Maintainer: Gilrain <pierre.buard+aur gmail com>
pkgname=kde-servicemenus-pology
pkgver=1.3
pkgrel=2
pkgdesc="A service menu to access Pology sieves."
arch=('any')
url="http://www.kde-apps.org/content/show.php/pology-servicemenu?content=84454"
license=('GPL3')
depends=('pology' 'kdebase-kdialog')
optdepends=('hunspell-lang: a spell-checking dictionary for your language(s)'
	    'aspell-lang: a spell-checking dictionary for your language(s)'
	    'ispell-lang: a spell-checking dictionary for your language(s)'
	    'languagetool: for grammar checks')
replaces=('pology-servicemenu')
conflicts=('pology-servicemenu')
source=("http://kde-apps.org/CONTENT/content-files/84454-pology-servicemenu-${pkgver}.tar.gz")
sha256sums=('505ec216bf6ba86e52e718a94122bf893f3172bac23256ac3423f7c793841aa8')

package() {
  install -d ${pkgdir}/usr/share/kde4/services/ServiceMenus
  install -Dm644 kde_localization-{mo,po,pot}.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus

  install -Dm644 README.txt ${pkgdir}/usr/share/doc/pology/ServiceMenu
  install -Dm644 README-fr.txt ${pkgdir}/usr/share/doc/pology/ServiceMenu-fr
}
