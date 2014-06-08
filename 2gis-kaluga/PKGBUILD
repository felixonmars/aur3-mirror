pkgname=2gis-kaluga
pkgver=28
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kaluga/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Kaluga-28.orig.zip")
md5sums=('59d9f408e3db7e5e4bd4488693968400')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaluga.dgdat" "${pkgdir}/opt/2gis/2gis-kaluga.dgdat" || return 1
  
}
