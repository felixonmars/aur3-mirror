pkgname=2gis-penza
pkgver=27
pkgrel=1
pkgdesc="Map of Penza for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Penza-27.orig.zip")
md5sums=('dcb15587060e6633b73cf6b1f5249648')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Penza.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/penza.dglf" || return 1
}
