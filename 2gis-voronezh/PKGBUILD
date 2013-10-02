pkgname=2gis-voronezh
pkgver=39
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-39.orig.zip")
md5sums=('63615acf002db6fdb848cade68500e4c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Voronezh.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/voronezh.dglf" || return 1
}
