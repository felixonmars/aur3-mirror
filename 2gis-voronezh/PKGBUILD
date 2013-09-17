pkgname=2gis-voronezh
pkgver=38
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-38.orig.zip")
md5sums=('7e2782bfc450a6fa9a9f571833b4c903')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Voronezh.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/voronezh.dglf" || return 1
}
