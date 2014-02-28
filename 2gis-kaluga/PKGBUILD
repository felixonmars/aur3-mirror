pkgname=2gis-kaluga
pkgver=24
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-24.orig.zip")
md5sums=('61c1cf227e3e79aedebc8dc15d398f46')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  
}
