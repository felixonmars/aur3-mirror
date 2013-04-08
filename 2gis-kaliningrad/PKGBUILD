pkgname=2gis-kaliningrad
pkgver=26
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-26.orig.zip")
md5sums=('6facbbfe0c8066a713e0377fdb167f46')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kaliningrad.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kaliningrad.dglf" || return 1
}
