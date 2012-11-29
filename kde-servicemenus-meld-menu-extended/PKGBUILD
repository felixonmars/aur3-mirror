# Contributor: Martin Cigorraga <msx@archlinux.us>

pkgname=kde-servicemenus-meld-menu-extended
pkgver=0.3
pkgrel=3
pkgdesc="A complete service menu to compare your files or folders with meld."
arch=('any')
url="http://kde-apps.org/content/show.php?content=155478"
depends=('kdebase-dolphin' 'meld')
license=('GPL')
provides=('kde-servicemenus-meld-menu-extended')
conflicts=('kde-servicemenus-meld-menu-extended')
source=(http://www.bug-a-boo.de/download/meld-menu.desktop)
md5sums=('b0b454209f1664d93e1ae3d2b6fc10a2')

package() {
  # create destination path
  install -d $pkgdir/usr/share/kde4/services/ServiceMenus
  # copy over file into path
  cp $srcdir/meld-menu.desktop $pkgdir/usr/share/kde4/services/ServiceMenus
}
