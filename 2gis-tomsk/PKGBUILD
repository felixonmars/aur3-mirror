pkgname=2gis-tomsk
pkgver=100
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-100.orig.zip")
md5sums=('17a192d6f62c1c629f1442f95e072107')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Tomsk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Tomsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Tomsk.dglf" || return 1
}
