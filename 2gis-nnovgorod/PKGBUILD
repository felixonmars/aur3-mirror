pkgname=2gis-nnovgorod
pkgver=55
pkgrel=2
pkgdesc="Map of Nizhny Novgorod for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-55.orig.zip")
md5sums=('6ba4e5bb33cac5c63db50cf13f945680')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Nizhny Novgorod.dgdat "${pkgdir}/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Nizhny Novgorod.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Nizhny Novgorod.dglf" || return 1
}
