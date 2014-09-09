pkgname=2gis-yaroslavl
pkgver=51
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yaroslavl/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Yaroslavl-51.orig.zip")
md5sums=('2c6b66fdf0891998eade5b82199e8ad8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/2gis-yaroslavl.dgdat" || return 1
  
}
