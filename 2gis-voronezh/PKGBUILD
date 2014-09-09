pkgname=2gis-voronezh
pkgver=50
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/voronezh/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Voronezh-50.orig.zip")
md5sums=('224982024d86e90d5aafdbf4abd25feb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/2gis-voronezh.dgdat" || return 1
  
}
