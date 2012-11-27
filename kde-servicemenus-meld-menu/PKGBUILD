# Contributor: MartÃ­n Cigorraga <msx@archlinux.us>

pkgname=kde-servicemenus-meld-menu
pkgver=0.1
pkgrel=1
pkgdesc="A simple desktop file which integrates a service menu for Meld. Currently only 2-way comparison."
arch=('any')
url="http://kde-look.org/content/show.php/Meld+Menu?content=155478"
depends=('kdebase-dolphin' 'meld')
license=('GPL')
provides=('kde-servicemenus-meld-menu')
conflicts=('kde-servicemenus-meld-menu')
source=(http://www.bug-a-boo.de/download/meld-menu.desktop)
md5sums=('a4ca3a7ee2948aeb20419beca8010a69')

package() {
  # create destination path
  install -d $pkgdir/usr/share/kde4/services/ServiceMenus
  # copy over file into path
  cp $srcdir/meld-menu.desktop $pkgdir/usr/share/kde4/services/ServiceMenus
}
