pkgname=2gis-penza
pkgver=30
pkgrel=1
pkgdesc="Map of Penza for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-30.orig.zip")
md5sums=('d5c8ad5a9d2e3c930ee23a93b635e20a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Penza.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/penza.dglf" || return 1
}
