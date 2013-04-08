pkgname=2gis-kirov
pkgver=15
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-15.orig.zip")
md5sums=('b1377245aeec1e124abdd63de306d8e4')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kirov.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kirov.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kirov.dglf" || return 1
}
