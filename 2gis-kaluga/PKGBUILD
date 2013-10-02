pkgname=2gis-kaluga
pkgver=20
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-20.orig.zip")
md5sums=('802f84855387108cc8eedad4c88120aa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kaluga.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kaluga.dglf" || return 1
}
