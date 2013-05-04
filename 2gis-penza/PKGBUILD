pkgname=2gis-penza
pkgver=25
pkgrel=2
pkgdesc="Map of Penza for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Penza-25.orig.zip")
md5sums=('77567a217e7b46d59e1f8eb91cd5a19b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Penza.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/penza.dglf" || return 1
}
