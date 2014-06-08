pkgname=2gis-spb
pkgver=40
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sankt-peterburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Spb-40.orig.zip")
md5sums=('ae0ef80881485fcceec309e6870a1631')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/2gis-spb.dgdat" || return 1
  
}
