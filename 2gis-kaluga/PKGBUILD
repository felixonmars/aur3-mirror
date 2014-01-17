pkgname=2gis-kaluga
pkgver=23
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-23.orig.zip")
md5sums=('f85bdd9220c06baec34d8e6ea5752ea8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/kaluga.dgdat" || return 1
  
}
