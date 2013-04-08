pkgname=2gis-nizhnevartovsk
pkgver=83
pkgrel=2
pkgdesc="Map of Nizhnevartovsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-83.orig.zip")
md5sums=('8a6f2dceebcba9739801ad9ee7230e0f')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat "${pkgdir}/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Nizhnevartovsk.dglf" || return 1
}
