pkgname=2gis-kaluga
pkgver=29
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kaluga/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kaluga-29.orig.zip")
md5sums=('5b34b60183f3bd4c5a116412797b0f24')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/2gis-kaluga.dgdat" || return 1
  
}
