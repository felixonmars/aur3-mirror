pkgname=2gis-kaluga
pkgver=22
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-22.orig.zip")
md5sums=('9a9cd99b7b32979bfca601d8bf90feb7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  
}
