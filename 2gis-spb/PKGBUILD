pkgname=2gis-spb
pkgver=45
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sankt-peterburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Spb-45.orig.zip")
md5sums=('8f4e2668ff5bf540bb0cca6003b8402e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/2gis-spb.dgdat" || return 1
  
}
