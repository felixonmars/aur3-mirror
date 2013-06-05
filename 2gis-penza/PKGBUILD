pkgname=2gis-penza
pkgver=26
pkgrel=1
pkgdesc="Map of Penza for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Penza-26.orig.zip")
md5sums=('9ff7d86c146a1043a1f4fba09424609d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Penza.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/penza.dglf" || return 1
}
