pkgname=kdeplasma-themes-panels-collection
pkgver=1.9
pkgrel=1
pkgdesc="Plasma Panels Collection"
url="http://kde-apps.org/content/show.php/Plasma+Panels+Collection+?content=147589"
depends=('kdebase-workspace')
arch=('any')
license=('GPL3')
source="http://kde-peace-settings.googlecode.com/files/Plama-Panels-Collection_1.9.tar.gz"
md5sums=('6b5490c067fa532b04d6ae4f04cccfc3')

build() {
  /bin/true
}

package() {
  cd ${srcdir}/Plama-Panels-Collection
  install -d ${pkgdir}/usr/share/kde4/services/
  for file in usr/share/kde4/services/*.desktop ; do
    cp "$file" ${pkgdir}/usr/share/kde4/services/
  done
  install -d ${pkgdir}/usr/share/apps/plasma/layout-templates/
  for folders in usr/share/kde4/apps/plasma/layout-templates/*/ ; do
    cp -r "$folders" ${pkgdir}/usr/share/apps/plasma/layout-templates/
  done
}