pkgname=2gis-voronezh
pkgver=40
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-40.orig.zip")
md5sums=('a2cf4275b954706d02eed9b5052aa718')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  
}
