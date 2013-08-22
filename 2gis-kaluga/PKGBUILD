pkgname=2gis-kaluga
pkgver=18
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-18.orig.zip")
md5sums=('aad0259f7e00407ae24031394d5e451b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaluga.dglf" || return 1
}
