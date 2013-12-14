pkgname=2gis-voronezh
pkgver=41
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-41.orig.zip")
md5sums=('dab383d2ad184a9cddd0d4b4dbafb56e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  
}
