pkgname=2gis-kaliningrad
pkgver=30
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-30.orig.zip")
md5sums=('e84cccff143e42625c2b39e0d1c3d94b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/kaliningrad.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaliningrad.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaliningrad.dglf" || return 1
}
