pkgname=2gis-yaroslavl
pkgver=49
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yaroslavl/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Yaroslavl-49.orig.zip")
md5sums=('40dbc34efff1a073071f319473b81378')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/2gis-yaroslavl.dgdat" || return 1
  
}
