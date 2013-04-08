pkgname=2gis-omsk
pkgver=104
pkgrel=2
pkgdesc="Map of Omsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-104.orig.zip")
md5sums=('eee306872aa73141b085648487783f46')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Omsk.dgdat "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Omsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Omsk.dglf" || return 1
}
