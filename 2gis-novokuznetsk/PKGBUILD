pkgname=2gis-novokuznetsk
pkgver=96
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-96.orig.zip")
md5sums=('8e703acc9111c436d460e8f04c6e13f1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novokuznetsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novokuznetsk.dglf" || return 1
}
