pkgname=2gis-kaluga
pkgver=17
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-17.orig.zip")
md5sums=('1210e6f3ba23838722e21321eeaae599')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaluga.dglf" || return 1
}
