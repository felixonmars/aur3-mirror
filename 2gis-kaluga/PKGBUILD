pkgname=2gis-kaluga
pkgver=33
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kaluga/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Kaluga-33.orig.zip")
md5sums=('f0135d0fe9a87dc40a733148f0469d19')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/2gis-kaluga.dgdat" || return 1
  
}
