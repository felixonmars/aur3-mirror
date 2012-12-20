pkgname=kdeplasma-themes-panels-collections
pkgver=2.0.2
pkgrel=1
pkgdesc="Plasma Panels Collections"
url="http://kde-apps.org/content/show.php/Plasma+Panels+Collections?content=155726"
depends=('kdebase-workspace')
arch=('any')
license=('GPL3')
source="http://kde-peace-settings.googlecode.com/files/plasma-panels-collection_$pkgver.orig.tar.gz"
md5sums=('38de73e33a8c9324d691db29bc8f3097')

build() {
  /bin/true
}

package() {
  cd ${srcdir}/
  install -d ${pkgdir}/usr/share/kde4/services/
  for file in usr/share/kde4/services/*.desktop ; do
    cp "$file" ${pkgdir}/usr/share/kde4/services/
  done
  install -d ${pkgdir}/usr/share/apps/plasma/layout-templates/
  for folders in usr/share/kde4/apps/plasma/layout-templates/*/ ; do
    cp -r "$folders" ${pkgdir}/usr/share/apps/plasma/layout-templates/
  done
} 
