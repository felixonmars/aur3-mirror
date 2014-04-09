pkgname=2gis-kaluga
pkgver=26
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-26.orig.zip")
md5sums=('d9ac4f96fb831278b1d874f3ad8f4e65')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/2gis-kaluga.dgdat" || return 1
  
}
