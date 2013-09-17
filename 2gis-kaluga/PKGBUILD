pkgname=2gis-kaluga
pkgver=19
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-19.orig.zip")
md5sums=('e7cd9ab5b52281bf8ef56002071a14e5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaluga.dglf" || return 1
}
