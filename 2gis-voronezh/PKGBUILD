pkgname=2gis-voronezh
pkgver=47
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/voronezh/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Voronezh-47.orig.zip")
md5sums=('2d9098f95005f58c8e4c3fb4396a9810')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/2gis-voronezh.dgdat" || return 1
  
}
