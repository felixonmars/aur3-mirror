pkgname=2gis-kaluga
pkgver=14
pkgrel=2
pkgdesc="Map of Kaluga for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-14.orig.zip")
md5sums=('4229edf2d167f608da41d05794e2ae9e')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kaluga.dgdat "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kaluga.dglf" || return 1
}
