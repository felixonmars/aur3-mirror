pkgname=2gis-nizhnevartovsk
pkgver=86
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-86.orig.zip")
md5sums=('6a23532d23b6f8bb18d82fad9f3640fa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/nizhnevartovsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Nizhnevartovsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/nizhnevartovsk.dglf" || return 1
}
