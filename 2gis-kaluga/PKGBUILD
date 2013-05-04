pkgname=2gis-kaluga
pkgver=15
pkgrel=2
pkgdesc="Map of Kaluga for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-15.orig.zip")
md5sums=('38271f6c810845e226dd8172542682db')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaluga.dglf" || return 1
}
